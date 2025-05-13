#!/bin/sh

# Replace config.js at runtime with environment variable
cat <<EOF > /usr/share/nginx/html/config.js
window._env_ = {
  REACT_APP_MOVIE_API_URL: "${REACT_APP_MOVIE_API_URL}"
};
EOF

exec "$@"
