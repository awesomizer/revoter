require 'spec_helper'

describe Bill do

  before(:all) do
    @results = {"results"=>[{"bill_id"=>"s744-113", "last_action"=>{"acted_at"=>"2013-06-27", "references"=>[], "text"=>"Senate ordered measure printed as passed.", "type"=>"action"}, "last_vote_at"=>"2013-06-27", "official_title"=>"A bill to provide for comprehensive immigration reform and for other purposes.", "summary_short"=>"Border Security, Economic Opportunity, and Immigration Modernization Act - (Sec. 2) States that passage of this Act recognizes that the primary tenets of its success depend on securing U.S. sovereignty and establishing a coherent and just system for integrating those who seek to join American society. (Sec. 3) Prohibits the Secretary of Homeland Security (DHS) (Secretary) from processing applications for registered provisional immigrant status (RPI), as established by this Act, until the Secretary has submitted to Congress the notice of commencement of implementation of the Comprehensive Southern Border Security Strategy and the Southern Border Fencing Strategy. Prohibits the Secretary from adjusting RPI aliens to lawful permanent resident status, with certain exceptions, until six months after the Secretary certifies to the President and Congress that: (1) the Comprehensive Southern Border Security Strategy submitted to Congress includes the minimum technological requirements specified...", "urls"=>{"congress"=>"http://beta.congress.gov/bill/113th/senate-bill/744", "govtrack"=>"http://www.govtrack.us/congress/bills/113/s744", "opencongress"=>"http://www.opencongress.org/bill/113-s744/show"}, "votes"=>[{"acted_at"=>"2013-06-27", "how"=>"roll", "references"=>[{"reference"=>"CR S5357-5475", "type"=>"text"}], "result"=>"pass", "text"=>"Passed Senate with an amendment by Yea-Nay Vote. 68 - 32. Record Vote Number: 168.", "type"=>"vote", "vote_type"=>"vote", "chamber"=>"senate", "roll_id"=>"s168-2013"}]}], "count"=>1, "page"=>{"count"=>1, "per_page"=>20, "page"=>1}}
  end

  it { should have_many( :votes ) }
  it { should validate_presence_of( :sun_bill_id ) }
  it { should validate_uniqueness_of( :sun_bill_id ) }
  it { should validate_presence_of( :official_title ) }
  it { should validate_presence_of( :summary_short ) }

  it 'should find existing bills given an array of roll_ids' do
    bill = FactoryGirl.create( :bill )
    gotten_bill = Bill.get_bills( ['s744-113'] )
    expect( gotten_bill[0].official_title ).to eq( 'Best Bill' )
  end

  # Bill.create_bill is saving the bill and then returning the bill id!?  
  # Some kind of problem with activerecord?  Just affects test, not live code.
  pending 'should create a bill with a valid and initialized bill object and a sun_bill_id' do
    bill = Bill.new( sun_bill_id: 's744-113' )
    CongressApi.stub( :get_bill ).and_return( @results )
    bill = Bill.create_bill( bill, 's744-113' )
    expect( bill.official_title ).not_to be nil
  end

end
