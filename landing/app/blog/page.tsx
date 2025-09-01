import Layout from "@/components/layout";
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
    <Layout currentPage="blog">

      {/* Hero Section */}
      <main className="container mx-auto px-4 lg:px-6 py-8">
        <div className="text-center mb-8">
          <h1 className="text-4xl lg:text-5xl font-bold mb-4">Health & Wellness Blog</h1>
          <p className="text-xl text-muted-foreground max-w-2xl mx-auto">
            Expert insights, tips, and strategies to help you break free from sugar addiction and build lasting healthy habits.
          </p>
        </div>

        {/* Blog Posts Grid */}
        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
          {blogPosts.map((post, index) => (
            <Card key={index} className="neubrutalism-card hover:border-accent transition-colors cursor-pointer">
              <CardHeader>
                <CardTitle className="text-foreground text-xl mb-2">{post.title}</CardTitle>
                <div className="flex items-center space-x-4 text-sm text-muted-foreground">
                  <span>{post.date}</span>
                  <span>•</span>
                  <span>{post.readTime}</span>
                </div>
              </CardHeader>
              <CardContent>
                <p className="text-foreground leading-relaxed">{post.excerpt}</p>
              </CardContent>
            </Card>
          ))}
        </div>

        {/* Coming Soon Message */}
        <div className="text-center py-8">
          <div className="max-w-2xl mx-auto">
            <h2 className="text-3xl font-bold mb-4">More Content Coming Soon</h2>
            <p className="text-muted-foreground text-lg">
              We&apos;re working on bringing you valuable content to support your health journey. 
              Check back soon for expert articles, success stories, and practical tips.
            </p>
          </div>
        </div>
      </main>
    </Layout>
  );
}