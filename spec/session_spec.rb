require 'spec_helper'

describe "Moped::Session" do
  
  let(:session) do 	
    Moped::Session.new(%w[127.0.0.1:27017], database: "moped_test")
  end

  before(:all) do
    session[:users].insert( {name: "test"})
    session[:users].find.remove_all
  end

  describe "#database_names" do
    
    let(:names) do
    	session.database_names
    end

    it "return a list of all database names" do
      names.should include("moped_test")
    end
  end

  describe "#databases" do

  	let(:databases) do
  		session.databases
  	end

  	let(:command) do
  		session.with(database: :admin).command(listDatabases: 1)
  	end

    it "should return a list of all databases" do
      databases.should eq(command)
    end
  end

  describe "#disconnect" do

  	let!(:disconnected) do
  		session.disconnect
  	end

    it "should disconnect from the cluster" do
      session.cluster.nodes.each do |node|
      	node.should_not be_connected
      end
    end

    it "returns true" do
      disconnected.should be_true
    end
  end

  describe "#drop" do
    it "should drop the current database" do
      session.with(database: "moped_test_2") do |session|
      	session.drop.should eq("dropped" => "moped_test_2", "ok" => 1)
      end
    end
  end
end

