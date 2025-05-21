# Quote
Simple Blog Server by Ruby on Rails

## Setup
1. Clone this repository
```bash
git clone https://github.com/miyake13000/quote.git
```
2. Create your own `home.html` to public
  * minimal configuration
    ```bash
    echo "<!doctype html><html><body><h1>Hello world</h1></body></html>" > public/home.html
    ```
2. Install specific Ruby version
  * Install Ruby specified with `.ruby-version`
3. Install dependencies
```bash
bundle config set path "vendor/bundle" && bundle install
```
4. Bring `master.key`
  * Bring `master.key` for `credentials.yml.enc` and put `config/`
  * Or if you lost `master.key`, reset `credentials.yml.enc`
5. Setup storage
```bash
RAILS_ENV=production ./bin/rails db:prepare
```
6. Setup assets
```bash
RAILS_ENV=production ./bin/rails assets:precompile
```
#### Optional: You can use docker compose
1. Install Docker: see [HP](https://docs.docker.com/engine/install/)
2. Do above 1, 2 and 4

## Usage
#### Start with native Ruby
```bash
rails -e production server -b 0.0.0.0 -p 80
```

#### Start with Docker compose
```bash
docker compose up
```
