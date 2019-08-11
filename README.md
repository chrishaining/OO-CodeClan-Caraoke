# OO-CodeClan-Caraoke
Demonstrates interactions between classes. The system is a karaoke bar made up of rooms, guests and songs.

#THE BRIEF
You have been approached to build software for a Karaoke bar. Specifically, they want you to build a software for checking guests in and out, plus handling songs.

#Minimum Viable Product
Your program should be test driven and should be able to:
* Create rooms, songs and guests
* Check in guests to rooms/Check out guests from rooms
* Add songs to rooms

#Extensions
* What happens if there are more guests trying to be checked in than there is free space in the room?
* Karaoke venues usually have an entry fee - So the guests could have money so they can pay it.

#Advanced extensions
* Guests could have a favourite song, and if their favourite song is on the room's playlist, they can cheer loudly! (return a string like "Whoo!")
* Rooms can keep track of the entry fees/spending of the guests - maybe add a bar tab/bar class?
* Add anything extra you think would be good to have at a karaoke venue!

#Comment
I chose the room as the class with main responsibility. I was going to create an additional reception or karaoke bar class (that is, a central point or building in which the rooms are located). However, I chose not to add this additional class as it would add a layer of complexity and was not mentioned in the brief. For a possible future extension, it might be an idea to add this reception or karaoke bar class. However, it would mean a lot of refactoring.
