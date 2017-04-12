# Use this song data for your tests
songs = [
  "The Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "The Phoenix - Consolation Prizes"
]

describe Song do

  @song = Song.new(songs[0])

end

describe Jukebox do

  before do
    @juke = Jukebox.new(songs)
  end

  it "turns on and has songs" do
    juke = Jukebox.new(songs)
    expect(juke.on?).to be true
    juke.songs = songs
  end

  it "can provide help" do
    expect(@juke.help).to include("Please select help, list, exit, or play.")
  end

  it "knows valid commands" do
    expect(@juke.command("list")).to include("The Phoenix - 1901")
    expect(@juke.command("play The Phoenix - Consolation Prizes")).to include(@juke.play("The Phoenix - Consolation Prizes"))
    expect(@juke.exit).to include("Goodbye, thanks for listening!")
    expect(@juke.on?).to be false
  end

  it "knows invalid commands" do
    expect(@juke.command("hello")).to include("invalid command")
  end

  it "exits" do
    expect(@juke.exit).to include("Goodbye, thanks for listening!")
    expect(@juke.on?).to be false
  end

  it "shows list" do
    expect(@juke.list).to include("1 The Phoenix - 1901")
  end

  it "plays song" do
    expect(@juke.play("The Phoenix - 1901")).to include ("now playing The Phoenix - 1901")
  end

end
