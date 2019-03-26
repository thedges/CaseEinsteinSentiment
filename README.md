# CaseEinsteinSentiment

THIS SOFTWARE IS COVERED BY [THIS DISCLAIMER](https://raw.githubusercontent.com/thedges/Disclaimer/master/disclaimer.txt).

This package contains a Case trigger to perform Einstein Sentiment analysis on the Case description field. Based on the sentiment (positive, neutral, negative), it will set the Case priority to Low, Medium, High respectively.

I "borrowed" approach and inspiration from these two articles:

[https://shrutisridharan.wordpress.com/2017/08/22/sentiment-analysis-using-salesforce-einstein/](https://shrutisridharan.wordpress.com/2017/08/22/sentiment-analysis-using-salesforce-einstein/)
https://github.com/gleb-kosteiko/salesforce-einstein-sentiment-analysis

The primary configuration that needs to be performed is setting values in the EinsteinAPISettings custom setting. Here is example image of setting this up:

![alt text](https://github.com/thedges/CaseEinsteinSentiment/blob/master/EinsteinAPISettings.png "Sample Image")

<a href="https://githubsfdeploy.herokuapp.com">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>
