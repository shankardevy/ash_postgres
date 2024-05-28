defmodule AshPostgres.TestRepo.Migrations.MigrateResources27 do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    drop(constraint("post_followers", "post_followers_pkey"))

    alter table(:post_followers) do
      modify(:follower_id, :uuid, primary_key: false)
      modify(:post_id, :uuid, primary_key: false)
      add(:id, :uuid, null: false, default: fragment("gen_random_uuid()"), primary_key: true)
    end
  end

  def down do
    drop(constraint("post_followers", "post_followers_pkey"))

    alter table(:post_followers) do
      remove(:id)
      modify(:post_id, :uuid, primary_key: true)
      modify(:follower_id, :uuid, primary_key: true)
    end
  end
end
