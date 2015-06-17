# Configure the Docker provider
provider "docker" {
  host = "tcp://localhost:2378/"
}

# Create a container
resource "docker_container" "redis" {
    image = "${docker_image.redis.latest}"
    name = "redis1"
}

resource "docker_image" "redis" {
    name = "redis:latest"
}
