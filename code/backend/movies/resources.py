from flask import jsonify
from flask.views import MethodView

# Dummy database to hold movie examples
movies = {
    "123": {"title": "Creed I", "description": "Boxing and personal struggle"},
    "456": {"title": "The Imitation Game", "description": "Alan Turing and codebreaking"},
    "789": {"title": "The Big Sick", "description": "Romantic comedy based on true story"},
    "321": {"title": "The Intouchables", "description": "Unlikely friendship and caregiving"},
    "654": {"title": "War Dogs", "description": "Arms dealing and business gone wild"},
}


class Movies(MethodView):
    def get(self, movie_id):
        if movie_id is None:
            # Return a list of all movies
            return jsonify({"movies": [dict({"title": movie["title"]}, **{"id": i}) for i, movie in movies.items()]})
        else:
            # Return the details of a specific movie
            return jsonify({"movie": movies[str(movie_id)]})
