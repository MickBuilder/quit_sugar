import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "SugAddict - Break Free from Sugar Addiction",
  description: "#1 app to really break from sugar addiction. Track your sugar intake, scan products, and build lasting healthy habits.",
  keywords: "sugar tracking, health app, addiction recovery, nutrition, barcode scanner",
  authors: [{ name: "SugAddict Team" }],
  icons: {
    icon: '/app-icon.svg',
    shortcut: '/app-icon.svg',
    apple: '/app-icon.svg',
  },
  openGraph: {
    title: "SugAddict - Break Free from Sugar Addiction",
    description: "#1 app to really break from sugar addiction",
    type: "website",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <head>
        {/* Google tag (gtag.js) */}
        <script async src="https://www.googletagmanager.com/gtag/js?id=G-VLPXJHB3PY"></script>
        <script
          dangerouslySetInnerHTML={{
            __html: `
              window.dataLayer = window.dataLayer || [];
              function gtag(){dataLayer.push(arguments);}
              gtag('js', new Date());
              gtag('config', 'G-VLPXJHB3PY');
            `,
          }}
        />
      </head>
      <body
        className={`${geistSans.variable} ${geistMono.variable} antialiased`}
      >
        {children}
      </body>
    </html>
  );
}
