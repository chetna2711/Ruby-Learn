RSpec.describe 'testing all matchers' do
  it 'checks equality' do
    expect(5).to eq(5)
    expect(1.3).to eq(1.3)
    expect("hello").to eq("hello")
    expect([1, 2, 3]).to eq([1, 2, 3])
    expect({ a: 1, b: 2 }).to eq({ a: 1, b: 2})
    expect(true).to eq(true)
    expect(false).to eq(false)
    expect(nil).to eq(nil)
  end

  it 'checks object identity & checks truthiness' do
    expect([1, 2, 3]).to be_an(Array)
    expect({ a: 1, b: 2 }).to be_a(Hash)
    expect(1.3).to be_a(Float)
    expect("hello").to be_a(String)
    expect(nil).to be_nil
    expect(1).to be_an(Integer) 
    expect(true).to be_truthy
    expect(false).to be_falsey
  end


  it 'checks for nil' do
    expect(nil).to be_nil
    expect(@variable).to be_nil
  end

  it 'checks truthiness and falsiness' do
    expect(true).to be_truthy
    expect(false).to be_falsey
    expect(nil).to be_falsey
    expect(0).to be_truthy # Note: 0 is considered truthy in Ruby
  end

  context 'Testing include Matcher'  do
  it 'checks inclusion in array' do
    expect([1, 2, 3]).to include(2)
  end

  it 'checks inclusion in string' do
    expect("hello world").to include("world")
  end

end

  it 'checks if string matches regex using match matcher' do
    expect("hello world").to match(/world/)
    expect("123abc").to match(/\d+/)
  end

  # it 'checks response status  using have_http_status Matcher' do
  #   get '/path'
  #   expect(response).to have_http_status(:ok)
  #   expect(response).to have_http_status(404)
  # end

  # it 'detects changes in object attributes using change Matcher' do
  #   user = User.create(name: "Old Name")
  #   expect { user.update(name: "New Name") }.to change { user.name }.from("Old Name").to("New Name")
  # end

    # it 'checks object attributes have_attributes' do
    #   user = User.new(name: "John", age: 30)
    #   expect(user).to have_attributes(name: "John", age: 30)
    # end
 
    it 'checks if block raises error using raise_error Matcher' do
      expect { raise "Oops" }.to raise_error("Oops")
      expect { raise ArgumentError }.to raise_error(ArgumentError)
    end

    it 'checks if value meets custom criteria using satisfy matcher' do
      expect(5).to satisfy { |value| value.even? }
    end

    it 'checks if value is within range us be_between matcher' do
      expect(5).to be_between(1, 10).inclusive
      expect(0).not_to be_between(1, 10).inclusive
    end

    it 'checks for selector presence using have_selector matcher' do
      render template: 'views/index.html.erb'
      expect(rendered).to have_selector("h1", text: "Welcome")
    end

    it 'checks for content presence using have_content matcher' do
      render template: 'views/index.html.erb'
      expect(rendered).to have_content("Hello World")
    end

    it 'checks for link presence using have_link matcher' do
      render template: 'views/students/index.html.erb'
      expect(rendered).to have_link("My Link", href: "/path")
    end
  
end

