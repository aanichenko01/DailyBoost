class QuoteHelperTest < ActionView::TestCase
  
    test "should return a HTTParty::Response" do
        assert get_quote.class.eql? HTTParty::Response
    end
    
    test "should return a quote with inpirational tag" do
        assert get_quote["tags"].include? "inspirational"
    end

    test "should return a quote in the api call" do
        assert get_quote["content"].present?
    end

    test "should return an author in the api call" do
        assert get_quote["author"].present?
    end

    test "should return two random quotes each time" do
        refute get_quote["content"].eql? get_quote["content"]
    end
    
end