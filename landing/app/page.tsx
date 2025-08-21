import Link from "next/link";
import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Star, Apple, Play } from "lucide-react";

export default function Home() {
  return (
    <div className="min-h-screen bg-background text-foreground">
      {/* Navigation */}
      <nav className="flex items-center justify-between p-6 lg:p-8 border-b-2 border-border">
        <div className="flex items-center space-x-2">
          <div className="w-8 h-8 bg-primary rounded-lg flex items-center justify-center border-2 border-border shadow-[4px_4px_0px_0px_rgba(0,0,0,1)]">
            <div className="w-6 h-6 bg-background rounded-lg flex items-center justify-center">
              <div className="w-3 h-3 bg-primary rounded-lg"></div>
            </div>
          </div>
          <span className="text-xl font-bold">Quit Sugar</span>
        </div>
        
        <div className="hidden md:flex items-center space-x-8">
          <Link href="/" className="text-foreground hover:text-accent transition-colors">
            Home
          </Link>
          <Link href="/blog" className="text-foreground hover:text-accent transition-colors">
            Blog
          </Link>
        </div>
        
        <Button className="neubrutalism-button">
          Get the app
        </Button>
      </nav>

      {/* Hero Section */}
      <main className="container mx-auto px-6 lg:px-8 py-20 lg:py-32">
        <div className="text-center max-w-4xl mx-auto mb-16">
          {/* Logo */}
          <div className="flex justify-center mb-8">
            <div className="w-16 h-16 bg-primary rounded-lg flex items-center justify-center border-2 border-border shadow-[4px_4px_0px_0px_rgba(0,0,0,1)]">
              <div className="w-12 h-12 bg-background rounded-lg flex items-center justify-center">
                <div className="w-6 h-6 bg-primary rounded-lg"></div>
              </div>
            </div>
            <span className="text-3xl font-bold ml-4 self-center">Quit Sugar</span>
          </div>

          {/* Main Headline */}
          <h1 className="text-4xl lg:text-6xl font-bold mb-6 leading-tight">
            #1 Life reset app to{" "}
            <span className="text-accent">get your health together</span>
          </h1>

          {/* Stats */}
          <div className="flex items-center justify-center space-x-2 mb-12">
            <Badge className="neubrutalism-card px-4 py-2">
              <span className="text-muted-foreground mr-2">10,000+ Installs</span>
            </Badge>
            <div className="flex items-center space-x-1">
              {[...Array(5)].map((_, i) => (
                <Star key={i} className="w-4 h-4 fill-accent text-accent" />
              ))}
              <span className="text-muted-foreground ml-2">4.8</span>
            </div>
          </div>
        </div>

        {/* Phone Mockup */}
        <div className="flex justify-center mb-20">
          <div className="relative">
            <div className="w-80 h-[650px] bg-secondary rounded-3xl p-4 border-2 border-border shadow-[8px_8px_0px_0px_rgba(0,0,0,1)]">
              <div className="w-full h-full bg-background rounded-3xl overflow-hidden relative border-2 border-border">
                {/* Status Bar */}
                <div className="flex justify-between items-center px-6 py-3 text-foreground text-sm border-b-2 border-border">
                  <span>9:41</span>
                  <div className="flex items-center space-x-1">
                    <div className="flex space-x-1">
                      <div className="w-1 h-1 bg-foreground rounded-full"></div>
                      <div className="w-1 h-1 bg-foreground rounded-full"></div>
                      <div className="w-1 h-1 bg-foreground rounded-full"></div>
                    </div>
                    <span>100%</span>
                    <div className="w-6 h-3 border border-foreground rounded-sm">
                      <div className="w-full h-full bg-foreground rounded-sm"></div>
                    </div>
                  </div>
                </div>

                {/* App Content */}
                <div className="px-6 py-4">
                  <h2 className="text-foreground text-2xl font-bold mb-2">Today&apos;s Journey</h2>
                  <p className="text-muted-foreground text-sm mb-6">You&apos;re making great progress</p>

                  {/* Progress Circle */}
                  <Card className="neubrutalism-card p-6 mb-4 bg-accent text-accent-foreground">
                    <div className="text-center">
                      <h3 className="text-accent-foreground text-lg font-semibold mb-4">Excellent progress!</h3>
                      <div className="relative w-32 h-32 mx-auto mb-4">
                        <div className="w-full h-full border-4 border-accent-foreground rounded-full flex items-center justify-center">
                          <div className="text-center">
                            <div className="text-accent-foreground text-2xl font-bold">15g</div>
                            <div className="text-accent-foreground/80 text-sm">of 25g</div>
                          </div>
                        </div>
                      </div>
                      <p className="text-accent-foreground/80 text-sm">You&apos;re doing great today</p>
                    </div>
                  </Card>

                  {/* Streak Counter */}
                  <Card className="neubrutalism-card p-4 mb-4">
                    <div className="flex items-center justify-between">
                      <div>
                        <p className="text-muted-foreground text-sm">Daily Streak</p>
                        <p className="text-foreground font-semibold">5 days</p>
                      </div>
                      <div className="text-accent">
                        🔥
                      </div>
                    </div>
                  </Card>

                  {/* Motivational Card */}
                  <Card className="neubrutalism-card p-4 bg-chart-2/20 border-chart-2">
                    <div className="flex items-center space-x-3">
                      <div className="w-8 h-8 bg-chart-2 rounded-lg flex items-center justify-center">
                        🧠
                      </div>
                      <div className="flex-1">
                        <p className="text-foreground font-medium">Keep up the great work!</p>
                        <p className="text-muted-foreground text-sm">2 items tracked today</p>
                      </div>
                    </div>
                  </Card>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Download Buttons */}
        <div className="flex justify-center space-x-4 mb-20">
          <Button 
            size="lg" 
            className="neubrutalism-button flex items-center space-x-3 px-6 py-4"
          >
            <Apple className="w-6 h-6" />
            <div className="text-left">
              <div className="text-xs text-primary-foreground/80">Download on the</div>
              <div className="font-semibold">App Store</div>
            </div>
          </Button>
          <Button 
            size="lg" 
            className="neubrutalism-button flex items-center space-x-3 px-6 py-4"
          >
            <Play className="w-6 h-6" />
            <div className="text-left">
              <div className="text-xs text-primary-foreground/80">GET IT ON</div>
              <div className="font-semibold">Google Play</div>
            </div>
          </Button>
        </div>
      </main>

      {/* Footer */}
      <footer className="border-t-2 border-border py-8">
        <div className="container mx-auto px-6 lg:px-8">
          <div className="flex flex-col md:flex-row justify-between items-center space-y-4 md:space-y-0">
            <div className="flex items-center space-x-2">
              <span className="text-muted-foreground">© 2025 built by</span>
              <span className="text-foreground">🚀 ⚡ 🎯</span>
              <span className="text-muted-foreground">Design + Build</span>
            </div>
            
            <div className="flex items-center space-x-6">
              <Link href="/support" className="text-muted-foreground hover:text-foreground transition-colors">
                Support
              </Link>
              <Link href="/instagram" className="text-muted-foreground hover:text-foreground transition-colors">
                Instagram
              </Link>
              <Link href="/tiktok" className="text-muted-foreground hover:text-foreground transition-colors">
                TikTok
              </Link>
              <Link href="/privacy" className="text-muted-foreground hover:text-foreground transition-colors">
                Privacy & Terms
              </Link>
            </div>
          </div>
        </div>
      </footer>
    </div>
  );
}