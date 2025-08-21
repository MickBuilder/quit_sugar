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
  title: "Quit Sugar - Break Free from Sugar Addiction",
  description: "#1 Life reset app to get your health back on track. Track your sugar intake, scan products, and build lasting healthy habits.",
  keywords: "sugar tracking, health app, addiction recovery, nutrition, barcode scanner",
  authors: [{ name: "Quit Sugar Team" }],
  openGraph: {
    title: "Quit Sugar - Break Free from Sugar Addiction",
    description: "#1 Life reset app to get your health back on track",
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
