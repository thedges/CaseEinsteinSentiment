global class EinsteinTriggerUtils {
   @future (callout=true)
   public static void runSentimentAnalysis(Id caseId, String text)
   {
       EinsteinService einstein = new EinsteinService();

       SentimentAnalysisResponse response = einstein.findSentiment(text);
       if (response != null && response.probabilities != null)
       {
           if (response.probabilities.size()  > 0)
           {
               SentimentAnalysisResponse.Probabilities prob = response.probabilities[0];
               if (prob.probability > 0.4)
               {
                   String priority = 'Low';
                   if (prob.label == 'negative')
                   {
                       priority = 'High';
                   }
                   else if (prob.label == 'positive')
                   {
                       priority = 'Low';
                   }
                   else if (prob.label == 'neutral')
                   {
                       priority = 'Medium';
                   }
                   
                   Case c = new Case();
                   c.Id = caseId;
                   c.priority = priority;
                   update c;
                   
                   PSChatterUtils.postFeedElement(null, caseId, 'Sentiment analysis set case priority to \'' + priority + '\'');
               }
           }
       }
   }
}