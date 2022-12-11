
https://streamable.com/q3rcyj

[ExM] [Release] NUI Announce system

Ad system for ExM equal to vrp framework ad system

This announcement system can send your work to announce something you want, the announcement will be seen by all connected users who are connected at that moment

What does the ad system do?

When you have a job like lspd for example to send an ad use / adlspd and adding the text you want to advertise

Example:

/ adlspd OPPOSITIONS OPEN FOR LSPD

When you send this ad, the ad will be visible to all those connected

FEATURES

Add more jobs
Change the images of the ad backgrounds
Charge for each ad
Change the duration of the ads

How to add another remote for another job?

In registerCommand change the command to whatever you want, for example if you want to add the casino job put adcasino, it doesn't need to have the ad, I put it to know that it is an ad

In xPlayer.job.name put the name of the job you use in your database

In the triggerClientEvent in the type section put the class that you have put in the .css

In the first print is the text that comes out when you don't have money to pay for the ad

In the second print is the text that comes out when you are not from said job

The false that is at the end of the last end, is to put that the command can only be used by the admins or not, if you have it in false the users will be able to use the command, if you have it in true only the admins can use the command, I only advise setting to true if you want to create an administrative ad

To change the ad price, in the config, lua

To add a banner to the ad, we go to style.css and create

.casino
    background-image:url("link of your image or where it is");
    color: #ffffff;
}

you can also change the color of the colored text



