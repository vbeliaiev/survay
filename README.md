# Survay

**Survay** is an educational project created as part of the Ruby on Rails courses by Sloboda Studio. The main goal of the project is to learn Ruby on Rails and practice web application development. The project is a platform for creating tests and answering questions.

This project is no longer maintained as it is purely educational.

## Key Technologies

The project uses the following technologies and libraries:

- **Ruby on Rails** (version 4.2.6) — web development framework.
- **MySQL** — database.
- **Sass** — for stylesheets.
- **CoffeeScript** — for writing JavaScript.
- **jQuery** — DOM manipulation and AJAX.
- **Turbolinks** — faster page loading.
- **Jbuilder** — for building JSON APIs.
- **Sorcery** — user authentication.
- **CanCanCan** — authorization and access control.
- **Bootstrap** (version 3) — responsive design framework.
- **Nested Form** — for handling nested forms.
- **Slim** — templating engine for simplified HTML.
- **Will Paginate** — pagination with Bootstrap support.
- **RSpec** — testing framework.
- **Factory Girl** and **FFaker** — for generating test data.

## Installation and Setup

1. Clone the repository:
   ```bash
   git clone git@github.com:vbeliaiev/survay.git
   cd survay
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Set up the database:
   ```bash
   rake db:create
   rake db:migrate
   ```

4. Run the server:
   ```bash
   rails server
   ```

5. Open your browser and navigate to `http://localhost:3000`.

## License

This project is licensed under the **MIT License**. Feel free to use, modify, and distribute it as you see fit.
