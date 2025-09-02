"use client";

import Layout from "../../components/layout";
import Image from "next/image";
import { useState } from "react";

export default function Support() {
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    message: ""
  });
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [submitStatus, setSubmitStatus] = useState<{
    type: 'success' | 'error' | null;
    message: string;
  }>({ type: null, message: '' });

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setIsSubmitting(true);
    setSubmitStatus({ type: null, message: '' });

    try {
      const response = await fetch('/api/send-support-email', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(formData),
      });

      const result = await response.json();

      if (response.ok) {
        setSubmitStatus({
          type: 'success',
          message: 'Thank you! Your message has been sent successfully.'
        });
        // Clear form on success
        setFormData({ name: "", email: "", message: "" });
      } else {
        setSubmitStatus({
          type: 'error',
          message: result.error || 'Failed to send message. Please try again.'
        });
      }
    } catch (error) {
      setSubmitStatus({
        type: 'error',
        message: 'Network error. Please check your connection and try again.'
      });
    } finally {
      setIsSubmitting(false);
    }
  };

  const handleInputChange = (field: string, value: string) => {
    setFormData(prev => ({
      ...prev,
      [field]: value
    }));
  };

  return (
    <Layout currentPage="support">
      <main className="container mx-auto px-4 lg:px-6 py-6 lg:py-12">
        <div className="text-center max-w-2xl mx-auto">
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

          {/* Support Title */}
          <h1 className="text-4xl lg:text-5xl font-bold mb-6">
            Support
          </h1>

          {/* Instructional Text */}
          <p className="text-lg text-muted-foreground mb-8">
            For faster support, send any questions and request directly to{" "}
            <a 
              href="mailto:sugaddict-support@mikebapps.com" 
              className="text-accent hover:underline"
            >
              sugaddict-support@mikebapps.com
            </a>
          </p>

          {/* Contact Form */}
          <form onSubmit={handleSubmit} className="space-y-6">
            {/* Name and Email Row */}
            <div className="flex flex-col lg:flex-row gap-4">
              <input
                type="text"
                placeholder="Name"
                value={formData.name}
                onChange={(e) => handleInputChange("name", e.target.value)}
                className="flex-1 neubrutalism-input px-4 py-3 text-foreground placeholder:text-muted-foreground"
                required
                disabled={isSubmitting}
              />
              <input
                type="email"
                placeholder="Email"
                value={formData.email}
                onChange={(e) => handleInputChange("email", e.target.value)}
                className="flex-1 neubrutalism-input px-4 py-3 text-foreground placeholder:text-muted-foreground"
                required
                disabled={isSubmitting}
              />
            </div>

            {/* Message Field */}
            <textarea
              placeholder="Message"
              value={formData.message}
              onChange={(e) => handleInputChange("message", e.target.value)}
              rows={6}
              className="w-full neubrutalism-input px-4 py-3 text-foreground placeholder:text-muted-foreground resize-none"
              required
              disabled={isSubmitting}
            />

            {/* Status Message */}
            {submitStatus.type && (
              <div className={`p-4 rounded-lg border-2 ${
                submitStatus.type === 'success' 
                  ? 'bg-green-50 border-green-500 text-green-700' 
                  : 'bg-red-50 border-red-500 text-red-700'
              }`}>
                {submitStatus.message}
              </div>
            )}

            {/* Send Button */}
            <button
              type="submit"
              disabled={isSubmitting}
              className={`neubrutalism-button px-8 py-3 text-lg font-medium ${
                isSubmitting ? 'opacity-50 cursor-not-allowed' : ''
              }`}
            >
              {isSubmitting ? 'Sending...' : 'Send'}
            </button>
          </form>
        </div>
      </main>
    </Layout>
  );
}
