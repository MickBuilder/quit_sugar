import Link from "next/link";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";

export default function Blog() {
  const blogPosts = [
    {
      title: "5 Signs You're Addicted to Sugar",
      excerpt: "Recognizing the warning signs of sugar dependency and how to break free from the cycle.",
      date: "March 15, 2025",
      readTime: "5 min read"
    },
    {
      title: "The Science Behind Sugar Cravings",
      excerpt: "Understanding what happens in your brain when you consume sugar and why it's so hard to quit.",
      date: "March 10, 2025",
      readTime: "7 min read"
    },
    {
      title: "Healthy Alternatives to Satisfy Your Sweet Tooth",
      excerpt: "Natural, nutritious options that can help curb sugar cravings without compromising your health.",
      date: "March 5, 2025",
      readTime: "4 min read"
    }
  ];

  return (
    <div className="min-h-screen bg-black text-white">
      {/* Navigation */}
      <nav className="flex items-center justify-between p-6 lg:p-8 border-b border-gray-800">
        <Link href="/" className="flex items-center space-x-2">
          <div className="w-8 h-8 bg-white rounded-full flex items-center justify-center">
            <div className="w-6 h-6 bg-black rounded-full flex items-center justify-center">
              <div className="w-3 h-3 bg-white rounded-full"></div>
            </div>
          </div>
          <span className="text-xl font-bold">Quit Sugar</span>
        </Link>
        
        <div className="hidden md:flex items-center space-x-8">
          <Link href="/" className="text-white hover:text-gray-300 transition-colors">
            Home
          </Link>
          <Link href="/blog" className="text-orange-400 font-semibold">
            Blog
          </Link>
        </div>
        
        <Link href="/">
          <Button variant="secondary" className="bg-white text-black hover:bg-gray-100">
            Get the app
          </Button>
        </Link>
      </nav>

      {/* Hero Section */}
      <main className="container mx-auto px-6 lg:px-8 py-16">
        <div className="text-center mb-16">
          <h1 className="text-4xl lg:text-5xl font-bold mb-6">Health & Wellness Blog</h1>
          <p className="text-xl text-gray-400 max-w-2xl mx-auto">
            Expert insights, tips, and strategies to help you break free from sugar addiction and build lasting healthy habits.
          </p>
        </div>

        {/* Blog Posts Grid */}
        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8 mb-16">
          {blogPosts.map((post, index) => (
            <Card key={index} className="bg-gray-900 border-gray-700 hover:border-orange-400 transition-colors cursor-pointer">
              <CardHeader>
                <CardTitle className="text-white text-xl mb-2">{post.title}</CardTitle>
                <div className="flex items-center space-x-4 text-sm text-gray-400">
                  <span>{post.date}</span>
                  <span>•</span>
                  <span>{post.readTime}</span>
                </div>
              </CardHeader>
              <CardContent>
                <p className="text-gray-300 leading-relaxed">{post.excerpt}</p>
              </CardContent>
            </Card>
          ))}
        </div>

        {/* Coming Soon Message */}
        <div className="text-center py-16">
          <div className="max-w-2xl mx-auto">
            <h2 className="text-3xl font-bold mb-4">More Content Coming Soon</h2>
            <p className="text-gray-400 text-lg">
              We&apos;re working on bringing you valuable content to support your health journey. 
              Check back soon for expert articles, success stories, and practical tips.
            </p>
          </div>
        </div>
      </main>

      {/* Footer */}
      <footer className="border-t border-gray-800 py-8">
        <div className="container mx-auto px-6 lg:px-8">
          <div className="flex flex-col md:flex-row justify-between items-center space-y-4 md:space-y-0">
            <div className="flex items-center space-x-2">
              <span className="text-gray-400">© 2025 built by</span>
              <span className="text-white">🚀 ⚡ 🎯</span>
              <span className="text-gray-400">Design + Build</span>
            </div>
            
            <div className="flex items-center space-x-6">
              <Link href="/support" className="text-gray-400 hover:text-white transition-colors">
                Support
              </Link>
              <Link href="/instagram" className="text-gray-400 hover:text-white transition-colors">
                Instagram
              </Link>
              <Link href="/tiktok" className="text-gray-400 hover:text-white transition-colors">
                TikTok
              </Link>
              <Link href="/privacy" className="text-gray-400 hover:text-white transition-colors">
                Privacy & Terms
              </Link>
            </div>
          </div>
        </div>
      </footer>
    </div>
  );
}