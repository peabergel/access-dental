const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './vendor/lib/preline/dist/*.js'
  ],
  safelist: [
    "border-red-500",
    "text-sky-500",
    "border-green-400",
    "text-red-500",
    "border-gray-300",
    "text-grey-700",
    "text-gray-600"
  ],
  theme: {
    extend: {
      keyframes: {
        zoom: {
          '0%': {
            transform: 'scale(1)',
          },
          '50%': {
            transform: 'scale(0.8)',
          },
          '100%': {
            transform: 'scale(1)',
          }
        }
      },
      screens: {
        '3xl': '1800px'
      },
      fontFamily: {
        sans: ['Poppins', 'sans-serif'],
      },
      colors: {
        'access-light-blue': '#EFF8FF',
        'access-blue': '#1E84B5',
        'access-dark': '#0E384C'
      }
    },
  },
  plugins: [
    require('../vendor/lib/preline/plugin'),
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ],
}
