import { render, screen } from '@testing-library/react';
import React from 'react';

import App from '../../App';

const movieHeading = process.env.FAIL_TEST ? 'WRONG_HEADING' : 'Movie List';

beforeAll(() => {
  window._env_ = {
    REACT_APP_MOVIE_API_URL: 'http://localhost:5000'
  };
});

test('renders Movie List heading', () => {
  render(<App />);
  const linkElement = screen.getByText(movieHeading);
  expect(linkElement).toBeInTheDocument();
});
