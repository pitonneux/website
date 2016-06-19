Event.delete_all
Location.delete_all
Organization.delete_all

Organization.create! [
  { name: 'We Work',
    description: "## Create Your Life's Work\r\nWe're proud to be sponsored by WeWork, who are generously providing our office location and venue for our workshops at WeWork Place Ville Marie.",
    remote_logo_url: 'http://res.cloudinary.com/pitonneux-com/image/upload/v1462717320/yedxz9ombf6g8poyzsj4.png' },
  { name: 'Topolino',
    description: "## Delicious Food for Thoughts\r\nCatering during the workshops is provided by our wonderful friends at topolino! Enjoy fresh, seasonal meals prepared by budding chefs eager to make you discover specialties from all around the world.",
    remote_logo_url: 'http://res.cloudinary.com/pitonneux-com/image/upload/v1462714773/eyk1uu51wrdaizh5by8m.png' }
]

Location.create! [
  { name: 'We Work',
    address: '3 Place Ville Marie',
    directions: "If you're arriving by metro through the underground shopping centre, look for signs pointing to 3 Place Ville Marie or 3 PVM, to the elevators. We are on the 4th floor. From the outside, look for the entrance to 3 PVM, same building as EA." }
]

Event.create! [
  { name: 'Learn iOS',
    description: "## Collaborative, peer-to-peer, project-based learning\r\n\r\nJoin a beginner-friendly community and learn how to build iOS or Android apps from the ground up! You'll learn Java to develop for Android, or Swift, Apple's new programming language, to develop for the iPhone. These Learning Circles are meant for people who want to learn how to build their first apps, as well as people who have already started and want to build up their skill. Even if you've never programmed before, we will help you on your new adventure!\r\n \r\nGroup sizes are small (10 to 15 people per group) so places are very limited.\r\n \r\n**\"So what will I be doing?\"**\r\n\r\nFor a month, you will be following an online course to learn either Android and Java, or Swift for iOS. Every week you will join us in the Learning Circle, for 4 sessions in total. By the end you'll have several projects to show off!\r\n \r\n**\"What is a Learning Circle all about?\"**\r\n\r\nLearn in an intimate group setting with people from all walks of life, with one common thread: new to coding and thirsty to learn!\r\nGet the unique opportunity to get help from mentors who are professional developers\r\nShare with the group what you are working on and how you are progressing, where you are stuck and need help\r\nLearn by working on your own projects and start building up a professional portfolio\r\nPresent your work and get feedback from the group\r\nInterview special guests and learn from their experience\r\nConnect with mentors and potential employers who help you build the real-world skills you will need on the job\r\n\r\n\"Sign me up for iOS!\"\r\n \r\n\"Sign me up for Android!\"\r\n \r\n**\"What do I need to participate?\"**\r\n\r\n- No programming experience required. But if you do have some, the course is adapted to your particular starting point.\r\n- You need a Mac to develop for the iPhone (Windows or Linux not supported), and it needs to be able to run Xcode (available for free on the App Store). Xcode requires the latest version of OS X and 3.8GB of free space. 8GB of RAM or more is recommended. You'll need a MacBook to bring to the weekly workshops.\r\n- You need a laptop running Windows, OS X or Linux to develop for Android. Please verify here that your laptop has the necessary specs to run Android Studio.\r\n- You need to plan for time every day to work on the course material. Aim for an hour each day if you can, but as the man says: \"Consistency is 🔑\". It's better to do 10 minutes every day than \"catch up\" on the weekend.\r\n- You need your availability on the workshop dates listed below.\r\n\r\n**Dates iOS:** Monday 6 June, 13 June, 20 June and 27 June.\r\n\r\n**Dates Android:** Tuesday 7 June, 14 June, 21 June and 28 June.\r\n\r\n**Cost:** $100\r\n \r\nSign up now for iOS!\r\nOr sign up for Android!",
    starts_at: 'Mon, 06 Jun 2016 15:30:00 UTC +00:00',
    featured: true,
    duration_in_min: 120,
    location_id: Location.last.id,
    remote_cover_image_url: 'http://res.cloudinary.com/pitonneux-com/image/upload/v1462722206/drxxybcn6cmserhzouzs.png' },
  { name: 'Coffee & Code study sessions',
    description: "## Grab a coffee, put on your earbuds, set a timer and FOCUS!\r\n\r\nFor those of us who need to get out of the house to stay sane, we have several study sessions a week that you are welcome to join. We have Coffee & Code sessions during the day-time but also in the evening and on Saturdays. These sessions are welcome to anyone, regardless of what you're learning or what kind of project you're working on.\r\n \r\nFor more details of our weekly meetups, please [join our group](http://www.meetup.com/pitonneux/) on Meetup.com",
    featured: true,
    remote_cover_image_url: 'http://res.cloudinary.com/pitonneux-com/image/upload/v1462727870/hkd1u23owrzdwpgnwfjo.png' }
]
