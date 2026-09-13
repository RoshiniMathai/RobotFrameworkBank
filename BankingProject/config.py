# Dictionary containing target site URLs for different environments
ENV_URLS = {
    "local": "http://localhost:8080",
    "staging": "https://globalsqa.com",
    "production": "https://globalsqa.com"
}

# Default Environment settings
ENVIRONMENT = "staging"
BROWSER = "headlesschrome"

# Dynamic assignments resolved at execution runtime
URL = ENV_URLS.get(ENVIRONMENT.lower(), ENV_URLS["staging"])
