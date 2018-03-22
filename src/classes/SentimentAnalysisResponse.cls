public class SentimentAnalysisResponse {
    public List<Probabilities> probabilities;
    
    public class Probabilities {
        public String label; 
        public Double probability;
    }
}