# CSV Import Ruby

CSV Import Ruby is a gem that allows users to add an importer function into ActiveRecord models with a simple configuration.

## Getting Started

To install CSV Import Ruby:

```ruby
gem install csv_import_ruby
```

## Implementation

In your ActiveRecord model:

```ruby
class Student < ActiveRecord::Base
  create_importer :name, :grade, { remove_whitespace: true }
end
```

Arguments are symbols that represent CSV column names, with the exception of the last argument which is a hash of options. Currently, the only option is `remove_whitespace`, which defaults to false.

**Symbols will be ignored unless they correspond to ActiveRecord attribute names.**

`create_importer` adds two methods to Ruby objects: `import!` and `import_file!`.

```ruby
Student.import!("Joe,85\nAnnie,90\nDaniel,80")
Student.import_file!("./roster.csv")
```

## License

This project is licensed under the MIT License.
