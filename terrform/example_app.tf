# Configure the Docker provider
provider "docker" {
    host = "tcp://${var.swarm_host}:${var.swarm_port}/"
}

# Create a container
resource "docker_container" "redis" {
    image = "${docker_image.redis.latest}"
    name = "redis1"
}

resource "docker_image" "redis" {
    name = "redis:latest"
}
