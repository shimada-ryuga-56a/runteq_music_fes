module.exports = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}", // すべてのJS、JSX、TS、TSXファイルをスキャン
  ],
  future: {
  },
  purge: ["./src/**/*.{js,jsx,ts,tsx}", "./public/index.html"],
  theme: {
    extend: {},
  },
  variants: {},
  plugins: [require("daisyui")],
  daisyui: {
    themes: ["light", "dark", "cupcake", "aqua", "pastel"],
  },
};

/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [],
  theme: {
    extend: {},
  },
  plugins: [],
}

