"use client";

import Link from "next/link";
import { Button } from "@/components/ui/button";
import Image from "next/image";

interface LayoutProps {
  children: React.ReactNode;
  currentPage?: 'home' | 'blog' | 'privacy';
}

export default function Layout({ children, currentPage = 'home' }: LayoutProps) {
  return (
    <div className="min-h-screen bg-background text-foreground">
      {/* Navigation */}
      <nav className="flex items-center justify-between p-3 lg:p-4 border-b-2 border-border">
        <div className="flex items-center space-x-8">
          <Link href="/" className="text-foreground hover:text-accent transition-colors font-medium">
            Home
          </Link>
          <Link href="/blog" className={`transition-colors font-medium ${
            currentPage === 'blog' ? 'text-accent' : 'text-foreground hover:text-accent'
          }`}>
            Blog
          </Link>
        </div>
        
        <Button 
          className="neubrutalism-button"
          onClick={() => {
            if (currentPage === 'home') {
              // If already on home page, scroll to download section
              const downloadSection = document.getElementById('download-buttons');
              if (downloadSection) {
                downloadSection.scrollIntoView({ behavior: 'smooth' });
              }
            } else {
              // If on other pages, navigate to home page with hash
              window.location.href = '/#download-buttons';
            }
          }}
        >
          Get the app
        </Button>
      </nav>

      {/* Main Content */}
      {children}

      {/* Footer */}
      <footer className="bg-muted py-4">
        <div className="container mx-auto px-3 lg:px-4">
          <div className="flex flex-col md:flex-row justify-between items-center space-y-4 md:space-y-0">
            <div className="flex items-center space-x-2">
              <span className="text-muted-foreground">©2025 SugAddict</span>
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
