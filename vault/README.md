# Vault - Docker Setup

This guide demonstrates how to set up Vault (HashiCorp) for secrets management using Docker Compose.

## Requirements

- Docker
- Docker Compose

## Default Credentials

**Vault Web Interface:**
- URL: http://localhost:8200
- Token: `root`

**Exposed Ports:**
- 8200: Vault Web Interface (UI)

## How to Use

1. **Start the service:**

    ```bash
    docker-compose up -d
    ```

2. **Access Vault Web Interface:**
    
    - Open your browser and go to: http://localhost:8200
    - Log in using the token root (as defined in the environment variable VAULT_DEV_ROOT_TOKEN_ID).

3. **Interact with Vault:**

    - You can now use Vault for managing secrets. For example, you can store and retrieve secrets via the Vault UI or CLI.

4. **Stop the service:**

    ```bash
    docker-compose down
    ```

## Data Persistence

Vault data is persisted in a Docker volume called `vault-data`. This ensures that your Vault data remains intact even if you stop or remove the container.

## Security

This setup is intended for local development. For production environments, consider:

- Changing the `root` token from root to a more secure value
- Enabling Vault's secure storage backends (e.g., Consul, AWS KMS)
- Implementing proper access control policies within Vault
- Enabling HTTPS for secure communication with Vault
- Restricting access to Vault's exposed ports for trusted users only