User.create!([
  {name: "bob", email: "user1@sample.com", goal: 175, password:"password"},
  {name: "charles", email: "user2@sample.com", password:"password", goal: 167},
  {name: "Ben White", provider: "facebook", uid: "1529730483", email: "backsheesh@gmail.com", password:"password", profile_pic: "http://graph.facebook.com/1529730483/picture?type=large", goal: 171},
  {name: "Chiggins", email: "newuser@sample.com", password:"password", goal: 180},
  {name: "Gus", email: "user3@sample.com", password:"password", goal: 170},
  {name: "Tom", email: "user4@sample.com", password:"password", goal: 180},
  {name: "Casey", email: "user5@sample.com", password:"password", goal: 123}
])
Friendship.create!([
  {user_id: 5, friend_id: 4},
  {user_id: 4, friend_id: 5},
  {user_id: 2, friend_id: 5},
  {user_id: 5, friend_id: 2},
  {user_id: 3, friend_id: 5},
  {user_id: 5, friend_id: 3},
  {user_id: 6, friend_id: 2},
  {user_id: 2, friend_id: 6},
  {user_id: 6, friend_id: 3},
  {user_id: 3, friend_id: 6},
  {user_id: 6, friend_id: 5},
  {user_id: 5, friend_id: 6},
  {user_id: 7, friend_id: 5},
  {user_id: 5, friend_id: 7},
  {user_id: 7, friend_id: 1},
  {user_id: 1, friend_id: 7}
])
WeighIn.create!([
  {weight: 166, pic_url: nil, user_id: 8, status: nil, date: nil},
  {weight: 168, pic_url: nil, user_id: 8, status: nil, date: nil},
  {weight: 155, pic_url: nil, user_id: 8, status: nil, date: nil},
  {weight: 159, pic_url: nil, user_id: 7, status: nil, date: nil},
  {weight: 180, pic_url: nil, user_id: 6, status: nil, date: nil},
  {weight: 180, pic_url: nil, user_id: 6, status: nil, date: nil},
  {weight: 176, pic_url: nil, user_id: 2, status: nil, date: nil},
  {weight: 160, pic_url: nil, user_id: 4, status: nil, date: nil},
  {weight: 170, pic_url: nil, user_id: 4, status: nil, date: nil},
  {weight: 170, pic_url: nil, user_id: 6, status: nil, date: nil},
  {weight: 160, pic_url: nil, user_id: 6, status: nil, date: nil},
  {weight: 170, pic_url: nil, user_id: 3, status: nil, date: nil},
  {weight: 180, pic_url: nil, user_id: 3, status: nil, date: nil},
  {weight: 208, pic_url: nil, user_id: 5, status: "filler", date: nil},
  {weight: 221, pic_url: nil, user_id: 4, status: "filler", date: nil},
  {weight: 192, pic_url: nil, user_id: 3, status: "filler", date: nil},
  {weight: 194, pic_url: nil, user_id: 2, status: "filler", date: nil},
  {weight: 191, pic_url: nil, user_id: 5, status: "filler", date: nil},
  {weight: 225, pic_url: nil, user_id: 4, status: "filler", date: nil},
  {weight: 177, pic_url: nil, user_id: 3, status: "filler", date: nil},
  {weight: 178, pic_url: nil, user_id: 2, status: "filler", date: nil},
  {weight: 140, pic_url: nil, user_id: 1, status: "dsafjnasdj", date: nil},
  {weight: 154, pic_url: nil, user_id: 1, status: "dsafjnasdj", date: nil},
  {weight: 174, pic_url: nil, user_id: 1, status: "dsafjnasdj", date: nil},
  {weight: 163, pic_url: nil, user_id: 1, status: "dsafjnasdj", date: nil},
  {weight: 154, pic_url: nil, user_id: 1, status: "dsafjnasdj", date: nil},
  {weight: 145, pic_url: nil, user_id: 1, status: "whatever", date: nil},
  {weight: 150, pic_url: nil, user_id: 1, status: "making progress", date: nil},
  {weight: 155, pic_url: nil, user_id: 1, status: "I'm getting christmas fat", date: nil}
])
