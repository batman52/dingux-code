General
-------

GReader2X aims to be a highly configurable text reader for the GP2x console.

It allows you to set the background and foreground colours and set the keys to use. It allows you to use any truetype font that you care to install on the GP2x as well as setting the font size and normal/bold attributes.  

It correctly wraps text so that words are not broken at the right margin. It also has an option to reconfigure Gutenberg texts to remove the hard return at the end of each line, so that paragraphs wrap correctly.

GReader2X will remember your position in each document and will automatically go to that position when the document is opened.  Further, if you exit Greader2X with a document displayed, the same document will be displayed when you next run GReader2X.

Installation
------------

Copy the files to a directory on the SD card.  Note the .cfg and .ttf files must be in the same directory as the .gpe file.

You can add additional truetype fonts in the same directory.

You will need to set the DocBase entry in the configuration to point to where your documents are stored.  I have a directory /mnt/SD/books with documents under there sorted into directories by author.  I also have GReader2X installed in the books directory, so the DocBase is set to "." by default.

You'll also need to set the AudioBase entry if you want to be able to play music while you read.  This entry should point to a directory of MP3 or OGG files.

Configuration
-------------

All Configuration is doen through the built in Configuration, this is accessed from the main meu (Press Select for the main menu by default).

You can then choose the setting you wish to change.

