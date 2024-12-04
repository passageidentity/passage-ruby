# frozen_string_literal: true

# Use in-memory store
config.cache_store = :memory_store, { size: 64.megabytes }

# Enable caching (ensure `tmp/caching-dev.txt` exists for development)
config.action_controller.perform_caching = true
