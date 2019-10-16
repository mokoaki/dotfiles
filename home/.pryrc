# frozen_string_literal: true

if Object.const_defined?(:Pry)
  Pry.commands.alias_command("ll", "ls")

  if Pry.plugins.key?("byebug")
    Pry.commands.alias_command("s", "step")
    Pry.commands.alias_command("n", "next")
    Pry.commands.alias_command("f", "finish")
    Pry.commands.alias_command("c", "continue")

    Pry::Commands.command(/\A\z/, "repeat last command") do
      _pry_.run_command Pry.history.to_a.last
    end
  end
end
