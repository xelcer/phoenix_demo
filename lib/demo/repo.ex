defmodule Demo.Repo do
  use Ecto.Repo, otp_app: :demo
  use Scrivener, page_size: 10
end
