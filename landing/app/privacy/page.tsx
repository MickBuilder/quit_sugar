import Layout from "@/components/layout";

export default function PrivacyPolicy() {
  return (
    <Layout currentPage="privacy">

      {/* Content */}
      <main className="container mx-auto px-4 lg:px-6 py-8 max-w-4xl">
        <div className="text-center mb-8">
          <h1 className="text-4xl lg:text-5xl font-bold mb-4">Privacy Policy and Terms of Service</h1>
        </div>

        <div className="prose prose-lg max-w-none">
          <p className="text-foreground text-lg leading-relaxed mb-6">
            Welcome to SugAddict. Before you can use our application, it is mandatory that you agree to these Extended Terms of Use and Privacy Policy. The following terms apply to all users of our application. By accessing or using our services, you confirm that you have read, understood, and accepted these terms and agree to be legally bound by them. If you do not agree to these terms, you must not use our application or services.
          </p>

          <section className="mb-8">
            <h2 className="text-2xl font-bold mb-4 text-foreground">Use of Our Services</h2>
            <p className="text-foreground leading-relaxed mb-4">
              <strong>Personal Use Only:</strong> Our services are intended for personal use only. You are strictly prohibited from using our services for commercial purposes. This includes, but is not limited to:
            </p>
            <ul className="list-disc pl-6 text-foreground space-y-2 mb-4">
              <li>Reselling our services</li>
              <li>Copying or reproducing any part of our services for commercial use</li>
              <li>Utilizing our services in a manner intended to generate income</li>
            </ul>
            <p className="text-foreground leading-relaxed">
              <strong>Software Protection:</strong> In accordance with copyright laws, you are not permitted to reverse engineer, decompile, disassemble, or otherwise attempt to discover the source code or the underlying algorithms of our services. Any violation of this policy may result in the immediate termination of your access and may lead to legal action.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-bold mb-4 text-foreground">Subscription Details</h2>
            <p className="text-foreground leading-relaxed mb-4">
              SugAddict operates on a subscription basis with billing occurring on a monthly or yearly cycle.
            </p>
            <ul className="list-disc pl-6 text-foreground space-y-2 mb-4">
              <li><strong>Android Users:</strong> We offer a 7-day free trial period during which Android users can use our services without charge.</li>
              <li><strong>iOS Users:</strong> iOS users are billed immediately upon subscribing.</li>
            </ul>
            <p className="text-foreground leading-relaxed">
              After the Android trial period—or immediately on iOS—your chosen payment method will be automatically billed according to our subscription plan unless you cancel your subscription. You are responsible for all charges incurred on your account.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-bold mb-4 text-foreground">Disclaimers and Limitation of Liability</h2>
            <p className="text-foreground leading-relaxed mb-4">
              <strong>Services Provided &quot;As Is&quot;:</strong> Our services are provided on an &quot;as is&quot; and &quot;as available&quot; basis, with no warranties—either express or implied—for any services. To the maximum extent permitted by law, SugAddict disclaims all implied warranties, including, without limitation, warranties related to merchantability, fitness for a particular purpose, and non-infringement.
            </p>
            <p className="text-foreground leading-relaxed">
              <strong>Limitation of Liability:</strong> Under no circumstances shall SugAddict be liable for any indirect, incidental, special, consequential, or punitive damages arising out of or related to your use or inability to use our services.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-bold mb-4 text-foreground">Indemnification</h2>
            <p className="text-foreground leading-relaxed">
              You agree to indemnify, defend, and hold harmless SugAddict, its affiliates, officers, employees, and agents from any claims, liabilities, damages, losses, and expenses (including reasonable attorneys&apos; fees) arising out of or in any way connected with your access to or use of our services, or your breach of these Terms.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-bold mb-4 text-foreground">Termination and Modification</h2>
            <ul className="list-disc pl-6 text-foreground space-y-3 mb-4">
              <li><strong>Termination:</strong> We reserve the right to suspend or terminate your access to our services at any time without prior notice, especially if you violate these Terms.</li>
              <li><strong>Modification of Terms:</strong> SugAddict reserves the right to update or modify these Terms at any time. Any changes will be posted on our website, and your continued use of our services after such modifications will constitute your acceptance of the new terms.</li>
            </ul>
          </section>

          <section className="mb-8">
            <h2 className="text-2xl font-bold mb-4 text-foreground">Privacy Policy</h2>
            <p className="text-foreground leading-relaxed mb-4">
              At SugAddict, we value and respect your privacy. We are committed to safeguarding your personal information and ensuring it is collected, stored, and used in accordance with applicable data protection laws.
            </p>

            <h3 className="text-xl font-semibold mb-4 text-foreground">Information Collection</h3>
            <p className="text-foreground leading-relaxed mb-4">
              We collect personal data that you voluntarily provide to us. This may include your name, email address, contact details, payment credentials, and other information supplied when you express interest in our services, create an account, or subscribe.
            </p>

            <h3 className="text-xl font-semibold mb-4 text-foreground">Use of Your Information</h3>
            <p className="text-foreground leading-relaxed mb-4">We use your personal data to:</p>
            <ul className="list-disc pl-6 text-foreground space-y-2 mb-4">
              <li>Provide and improve our services</li>
              <li>Manage your account and process subscriptions</li>
              <li>Communicate with you (including customer support)</li>
              <li>Ensure the security and integrity of our services</li>
            </ul>

            <h3 className="text-xl font-semibold mb-4 text-foreground">Data Security and Retention</h3>
            <p className="text-foreground leading-relaxed mb-4">
              We implement appropriate technical and organizational measures to protect your personal data. Your data is retained only for as long as necessary to fulfill the purposes outlined in this Privacy Policy or as required by law.
            </p>

            <h3 className="text-xl font-semibold mb-4 text-foreground">Your Data Rights</h3>
            <p className="text-foreground leading-relaxed mb-4">You are entitled to:</p>
            <ul className="list-disc pl-6 text-foreground space-y-2 mb-4">
              <li>Access your personal data</li>
              <li>Correct any inaccuracies</li>
              <li>Update or delete your personal data</li>
              <li>Restrict or object to the processing of your data</li>
              <li>Request a copy of your data in a portable format</li>
            </ul>
            <p className="text-foreground leading-relaxed">
              If you wish to exercise any of these rights, please contact us.
            </p>
          </section>
        </div>

        <div className="text-center mt-8 pt-6 border-t border-border">
          <p className="text-muted-foreground">Updated on 27 June, 2025</p>
        </div>
      </main>
    </Layout>
  );
}