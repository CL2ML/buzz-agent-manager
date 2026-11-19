# Buzz Agent Manager

Single-container private control plane for Buzz agents and harnesses. It provides one-admin login, agent role/prompt/harness editing, container visibility, logs, encrypted provider-key storage and configuration manifests.

Required runtime secrets are `ADMIN_PASSWORD_HASH`, `SESSION_SECRET` and a 32-byte hex `MANAGER_ENCRYPTION_KEY`. The Docker socket is supplied only to the server side, never to browser code. Provider secrets are encrypted at rest and never returned by the API.

This manager does not bypass Buzz identity registration; it reports that state explicitly when relay registration is unavailable.
