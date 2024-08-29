Ad targeting criteria is a simple script that maps the twitter archive data `./data/ad-engagements.js` to a map of targeting criteria types and their values.

Targeting criteria detected: 
`[
'Follower look-alikes', 
'Platforms', 
'Age', 
'Languages', 
'Interests', 
'Locations', 
'Keywords', 
'Conversation topics', 
'Lists', 
'App Activity', 
'Retargeting campaign engager', 
'Retargeting engagement type', 
'Events', 
'OS versions', 
'Website Activity', 
'Engagement', 
'Gender', 
'Unknown'
]`

To gain access to your twitter archive data follow these instructions:

  - In the web app, go to the left-hand menu and click on More. In the mobile app, tap your personal icon in the upper-left corner.
  - Select Settings and Support > Settings and privacy > Your account. (Or, if you’re in a hurry, you can just use this link.)
  - Click on Download an archive of your data. You may be asked to verify your account.
  - Click on Request archive.
  - Download ZIP and unpack in the project folder

To extract targeting criteria from your twitter archieve follow these instructions:
  - Give permission to run script `chmod +x script.sh` 
  - Run script `./script.sh`
