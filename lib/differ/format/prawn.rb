module Differ
  module Format
    module Prawn
      # show changes in a format useable in Prawn gem (PDF generator)
      #  note: you must have {inline_format: true} for the text style
      class << self
        def format(change)
          (change.change? && as_change(change)) ||
          (change.delete? && as_delete(change)) ||
          (change.insert? && as_insert(change)) ||
          ''
        end

        # highlight additions in Forest Green and underlined
        def as_insert(change)
          "<color rgb=\"#228B22\"><u>#{change.insert.inspect}</u></color>"
        end

        # highlight deletions in Red and struck-through text
        def as_delete(change)
          "<color rgb=\"#FF0000\"><strikethrough>#{change.delete.inspect}</strikethrough></color>"
        end

        def as_change(change)
          as_delete(change.delete.inspect) << as_insert(change.insert.inspect)
        end
      end
    end
  end
end