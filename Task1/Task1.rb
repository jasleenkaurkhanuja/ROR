# Comprehensive Exercise:
# name, category, quantity, price

class Inventory_Item 
    @@total_items = 0
    @@Inventory_array = [] ##objects
    @@Inventory_hash = [] ##arry of hashes
    def initialize(name, category, quantity, price)
        @name = name;
        @category = category;
        @quantity = quantity;
        @price = price
        @@total_items = @@total_items + 1;

        hash = {
            name: @name,
            category: @category,
            price: @price,
            quantity: @quantity
        };
        
        @@Inventory_hash.push(hash)
        @@Inventory_array<<self
    end

    def self.total_items
        @@total_items
    end
    def self.Inventory_array
        @@Inventory_array
    end
    def self.Inventory_hash
        @@Inventory_hash
    end

    def display_details 
        print "Name : ", @name, "\n";
        print "Category : ", @category, "\n";
        print "Quantity : ", @quantity, "\n";
        print "Price : ", @price, "\n\n";
    end

    def check_availability
        if @quantity < 10
            print "Low stock, order more\n"
        else
            print "Sufficient stock\n"
        end
    end

    def self.total_value 
        total_price = 0;
        for i in @@Inventory_array do
            total_price = total_price + i.instance_variable_get(:@quantity) * i.instance_variable_get(:@price);
        end
        p total_price
    end
end

class Discounted_Item  < Inventory_Item
    def initialize(name, category, quantity, price, discounted_percentage)
        super(name, category, price, quantity)
        @discounted_percentage = discounted_percentage;
    end
    def display_details
         
        print "Name : ", @name, "\n";
        print "Category : ", @category, "\n";
        print "Quantity : ", @quantity, "\n";
        print "Original Price : ", @price, "\n";
        print "Discounted Price : ", @price - (@discounted_percentage * @price) / 100.00, "\n\n"
    end
end

def display_array
    for i in Inventory_Item.Inventory_hash do 
        i.each{|k, v| print k, " : ", v, "\n"};
        puts
    end 
end

item1 = Inventory_Item.new("Electric Guitar", "Musical", 20, 5000.00);
item2 = Inventory_Item.new("Mahindra Thar", "Vehicle", 5, 2000000.00);
item3 = Inventory_Item.new("Washing Machine", "Electronics", 15, 37000.00);

print "display using instance method\n\n"
item1.display_details
item2.display_details
item3.display_details

print "Display using another method\n\n"
display_array

## check_availability

for i in Inventory_Item.Inventory_array do 
    print "Name : ", i.instance_variable_get(:@name), "\n"
    print "Category : ", i.instance_variable_get(:@category), "\n"
    print "Availability : "
    i.check_availability
    puts
end

# Creating a new item by taking input from the user:

print "Name : "
name = gets.chomp();
print "\nCategory : "
category = gets.chomp()
print "\nPrice : "
price = gets.chomp().to_i
print "\nQuantity : "
quantity = gets.chomp().to_i 

new_item = Inventory_Item.new(name, category, price, quantity);
display_array

##example of discounted price
discounted_obj = Discounted_Item.new("Mahindra Thar", "Vehicle", 2000000, 5, 5)
discounted_obj.display_details

print "Total value of the inventory is : "
Inventory_Item.total_value

