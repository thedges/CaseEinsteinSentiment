public class PSChatterUtils {
    public static void postMention(ID mentionId, ID subjectId, ID networkId, String body)
    {
        if (networkId == null) networkId = Network.getNetworkId();
        
        ConnectApi.FeedItemInput feedItemInput = new ConnectApi.FeedItemInput();
        feedItemInput.visibility = ConnectApi.FeedItemVisibilityType.AllUsers;
        ConnectApi.MentionSegmentInput mentionSegmentInput = new ConnectApi.MentionSegmentInput();
        ConnectApi.MessageBodyInput messageBodyInput = new ConnectApi.MessageBodyInput();
        ConnectApi.TextSegmentInput textSegmentInput = new ConnectApi.TextSegmentInput();
        
        messageBodyInput.messageSegments = new List<ConnectApi.MessageSegmentInput>();
        
        mentionSegmentInput.id = mentionId;
        messageBodyInput.messageSegments.add(mentionSegmentInput);
        
        textSegmentInput.text = body;
        messageBodyInput.messageSegments.add(textSegmentInput);
        
        feedItemInput.body = messageBodyInput;
        feedItemInput.feedElementType = ConnectApi.FeedElementType.FeedItem;
        feedItemInput.subjectId = subjectId;
        
        ConnectApi.FeedElement feedElement = ConnectApi.ChatterFeeds.postFeedElement(networkId, feedItemInput);
    }
    
    public static void postFeedElement(ID networkId, Id subjectId, String msg)
    {
        if (networkId == null) networkId = Network.getNetworkId();
        ConnectApi.FeedElement feedElement = ConnectApi.ChatterFeeds.postFeedElement(networkId, subjectId, ConnectApi.FeedElementType.FeedItem, msg);
    }
}