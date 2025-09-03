import Layout from "../components/layout";
import Image from "next/image";

export default function Home() {
  return (
    <Layout currentPage="home">

      {/* Hero Section */}
      <main className="container mx-auto px-4 lg:px-6 py-6 lg:py-12">
        <div className="text-center max-w-4xl mx-auto mb-6">
          {/* Logo */}
          <div className="flex justify-center mb-3">
            <div className="w-16 h-16 bg-primary rounded-lg flex items-center justify-center shadow-[6px_6px_0px_0px_rgba(0,0,0,1)] relative">
              <Image 
                src="/app-icon.png" 
                alt="SugAddict App Icon" 
                width={48} 
                height={48}
                className="w-14 h-14 rounded-lg"
              />
            </div>
            <span className="text-3xl font-bold ml-4 self-center">SugAddict</span>
          </div>

          {/* Main Headline */}
          <h1 className="text-4xl lg:text-6xl font-bold mb-3 leading-tight">
            #1 app to really{" "}
            <span className="text-accent">break from sugar addiction</span>
          </h1>


        </div>

        {/* Phone Mockup with App Screen */}
        <div className="flex justify-center mb-6">
          <div className="relative">
            <div className="w-80 h-[650px] bg-white rounded-3xl p-2 border-2 border-border shadow-[8px_8px_0px_0px_rgba(0,0,0,1)]">
              <div className="w-full h-full bg-background rounded-3xl overflow-hidden relative border-2 border-border">
                {/* App Screen Content */}
                <div className="w-full h-full">
                  <Image 
                    src="/images/app-screen.png" 
                    alt="Quit Sugar App Screen" 
                    width={320} 
                    height={600}
                    className="w-full h-full object-cover"
                    priority
                  />
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Download Buttons */}
        <div id="download-buttons" className="flex justify-center space-x-6 mb-6">
          <a 
            href="https://apps.apple.com/app/sugaddict" 
            target="_blank" 
            rel="noopener noreferrer"
            className="inline-block"
          >
            <Image 
              src="/images/apple-download-black-btn.svg" 
              alt="Download on the App Store" 
              width={140} 
              height={42}
              className="hover:opacity-80 transition-opacity"
            />
          </a>
          <a 
            href="https://play.google.com/store/apps/details?id=com.sugaddict.app" 
            target="_blank" 
            rel="noopener noreferrer"
            className="inline-block"
          >
            <Image 
              src="/images/google-play-button.png" 
              alt="Get it on Google Play" 
              width={140} 
              height={42}
              className="hover:opacity-80 transition-opacity"
            />
          </a>
        </div>
      </main>
    </Layout>
  );
}