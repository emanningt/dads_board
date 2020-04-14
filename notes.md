User
    - login and out 
    - secure with bycript 
    - has_many comments 
    - has_may Ideas, through reviews

Type
    name
    has_many fun_ideas

Ideas
    belongs_to type
    belongs_to user
    description/               
    has_may comments 
    has_many users, through comments

comments 
    post_id 
    user_id 
    description
