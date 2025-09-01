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
      <body
        className={`${geistSans.variable} ${geistMono.variable} antialiased`}
      >
        {children}
      </body>
    </html>
  );
}
