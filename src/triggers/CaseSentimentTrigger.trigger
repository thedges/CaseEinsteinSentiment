trigger CaseSentimentTrigger on Case (after insert, after update) {
    
    for (Case c: Trigger.new)
    {
        Case oldCase = null;
        if (Trigger.isUpdate)
        {
            oldCase = Trigger.oldMap.get(c.Id);
        }
        
        if (oldCase == null || (c.Description != oldCase.Description))
        {
            
            ////////////////////////////////////////////////////////////////////////
            // run sentiment analysis only on new cases or if Description changed //
            ////////////////////////////////////////////////////////////////////////
            String tmpStr = c.Description;
            
            if (c.Description.contains('voice.google.com') && c.Description.length() > 27)
            {
                Integer endIndex = c.Description.indexOf('play message');
                if (endIndex > 27)
                {
                    tmpStr = c.Description.subString(27, endIndex);
                }
                else
                {
                    tmpStr = c.Description.subString(27);
                }
                tmpStr = tmpStr.replaceAll('\n', ' ').replaceAll('\r', '');
                System.debug(tmpStr);
            }
            EinsteinTriggerUtils.runSentimentAnalysis(c.Id, tmpStr);
        }
    }
    
}