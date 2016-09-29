require './enumerable_methods.rb'

describe Enumerable do

  let(:dummy_class) { Class.new { include Enumerable} }

  before(:each) do
    # why don't these work?
    dummy_object = dummy_class.new
    array1 = [1,3,2,4]
    array2 = ["2", "text", 4, {"test" => 2}]
  end

  describe "#my_each" do

    it "yields to a block" do
      array1 = [1,3,2,4]
      expect { |b| array1.my_each(&b) }.to yield_control
    end

    it "yields once for every item in the object given" do
      array1 = [1,3,2,4]
      expect { |b| array1.my_each(&b) }.to yield_control.exactly(4).times
    end

    it "assigns method calls in block to each of its object's members" do
      array2 = ["2", "text", 4]
      output = ""
      array2.my_each { |e| output << e.to_s }
      expect(output).to eq("2text4")
    end

  end

  describe "#my_select" do

    it "yields to a block" do
      array1 = [1,3,2,4]
      expect { |b| array1.my_select(&b) }.to yield_control
    end

    it "yields once for every item in the object given" do
      array1 = [1,3,2,4]
      expect { |b| array1.my_select(&b) }.to yield_control.exactly(4).times
    end

    it "returns a block with elements matching result of block" do
      array2 = ["2", "text", 4]
      array2 = array2.my_select { |e| e.is_a?(Integer) }
      expect(array2).to eq([4])
    end

  end

  describe "#my_all?" do

    it "yields to a block" do
      array1 = [1,3,2,4]
      expect { |b| array1.my_all?(&b) }.to yield_control
    end

    it "returns true if any element in object matches block (or v/v)" do
      array2 = ["2", "text", 4]
      expect(array2.my_all? { |e| e.is_a?(Integer) }).to eq(false)
    end

  end

  describe "#my_any?" do

    it "yields to a block" do
      array1 = [1,3,2,4]
      expect { |b| array1.my_any?(&b) }.to yield_control
    end

    it "yields once for every item in the object given" do
      array1 = [1,3,2,4]
      expect { |b| array1.my_any?(&b) }.to yield_control.exactly(4).times
    end

    it "returns true if any element in object matches block (or v/v)" do
      array2 = ["2", "text", 4]
      expect(array2.my_any? { |e| e.is_a?(Integer) }).to eq(true)
    end

  end

  describe "#my_none?" do

    it "yields to a block" do
      array1 = [1,3,2,4]
      expect { |b| array1.my_none?(&b) }.to yield_control
    end

    it "yields once for every item in the object given" do
      array1 = [1,3,2,4]
      expect { |b| array1.my_none?(&b) }.to yield_control.exactly(4).times
    end

    it "returns true no element in object matches block (or v/v)" do
      array2 = ["2", "text", 4]
      expect(array2.my_none? { |e| e.is_a?(Integer) }).to eq(false)
    end

  end

  describe "#my_count" do

    # it "yields to a block" do
    #   array1 = [1,3,2,4]
    #   expect { |b| array1.my_none?(&b) }.to yield_control
    # end

  end

end