# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

users = User.create([
    {username: "mmcnulty"},
    {username: "JustOneSimpleHuman"},
    {username: "the_best_artist_eva"},
    {username: "dumb_username"}]
)


artworks = Artwork.create([
    {title: "Mona Lisa" ,img_url:"g.com/1", artist_id: users[1].id},
    {title: "Starry Night",img_url:"g.com/2", artist_id: users[2].id},
    {title: "Water Lily",img_url:"g.com/3", artist_id: users[3].id },
    {title: "The Scream" ,img_url:"g.com/4", artist_id: users[0].id}] 
)

artwork_shares = ArtworkShare.create([
    {artwork_id: artworks[0].id, viewer_id: users[3].id},
    {artwork_id: artworks[1].id, viewer_id: users[3].id},
    {artwork_id: artworks[3].id, viewer_id: users[3].id},
    {artwork_id: artworks[0].id, viewer_id: users[2].id},
    {artwork_id: artworks[2].id, viewer_id: users[2].id},
    {artwork_id: artworks[3].id, viewer_id: users[2].id},
    {artwork_id: artworks[1].id, viewer_id: users[1].id},
    {artwork_id: artworks[2].id, viewer_id: users[1].id},
    {artwork_id: artworks[3].id, viewer_id: users[1].id},
    {artwork_id: artworks[0].id, viewer_id: users[0].id},
    {artwork_id: artworks[1].id, viewer_id: users[0].id},
    {artwork_id: artworks[2].id, viewer_id: users[0].id}]
)


comments = Comment.create([
    {artwork_id: artworks[0].id, commenter_id: users[3].id, body: "A lot of stuff"},
    {artwork_id: artworks[1].id, commenter_id: users[3].id, body: "This is a comment"},
    {artwork_id: artworks[3].id, commenter_id: users[3].id, body: "Great art, lol jk"},
    {artwork_id: artworks[0].id, commenter_id: users[2].id, body: "nice work"},
    {artwork_id: artworks[2].id, commenter_id: users[2].id, body: "☆☆☆☆☆"},
    {artwork_id: artworks[3].id, commenter_id: users[2].id, body: "seriously, bunch of comments to seed lol"},
    {artwork_id: artworks[1].id, commenter_id: users[1].id, body: "It's hard"},
    {artwork_id: artworks[2].id, commenter_id: users[1].id, body: "I'm so not creative with seed files"},
    {artwork_id: artworks[3].id, commenter_id: users[1].id, body: "I can't think of anything"},
    {artwork_id: artworks[0].id, commenter_id: users[0].id, body: "☆ ☄ ☆"},
    {artwork_id: artworks[1].id, commenter_id: users[0].id, body: "Why are you reposting my art?"},
    {artwork_id: artworks[2].id, commenter_id: users[0].id, body: "☆ 😂"}]
)

