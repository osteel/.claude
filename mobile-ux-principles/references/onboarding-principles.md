# UX Good Practices and Anti-patterns

Distilled from all 67 UserOnboard.com onboarding teardowns (Netflix, Slack, Duolingo, Dropbox, Canva, Zapier, and 61 others). Findings are semantically deduplicated across apps; parenthetical names cite example apps where the pattern was observed.

## Contents

1. [Value proposition and first impressions](#1-value-proposition-and-first-impressions)
2. [Trust, social proof and legal](#2-trust-social-proof-and-legal)
3. [Signup and account creation](#3-signup-and-account-creation)
4. [Forms, input and validation](#4-forms-input-and-validation)
5. [Permissions and notification requests](#5-permissions-and-notification-requests)
6. [First-run experience and time-to-value](#6-first-run-experience-and-time-to-value)
7. [Tours, tooltips and guided tutorials](#7-tours-tooltips-and-guided-tutorials)
8. [Empty states and sample content](#8-empty-states-and-sample-content)
9. [Copywriting, tone and CTA labels](#9-copywriting-tone-and-cta-labels)
10. [Visual hierarchy and consistency](#10-visual-hierarchy-and-consistency)
11. [Personalization and segmentation](#11-personalization-and-segmentation)
12. [Progress, feedback and celebration](#12-progress-feedback-and-celebration)
13. [Gamification and rewards](#13-gamification-and-rewards)
14. [Loading, performance and error handling](#14-loading-performance-and-error-handling)
15. [Social features, invitations and virality](#15-social-features-invitations-and-virality)
16. [Email and re-engagement](#16-email-and-re-engagement)
17. [Monetization, pricing and upsells](#17-monetization-pricing-and-upsells)
18. [Ending onboarding and handoff to exploration](#18-ending-onboarding-and-handoff-to-exploration)

## 1. Value proposition and first impressions

### Good practices

- Lead with a clear, benefit-focused value proposition users grasp instantly (Netflix "Watch TV shows & movies anytime, anywhere"; Slack "Be less busy")
- Answer "what can I do here?" early and prominently; frame in user outcomes, not features ("Bring your music anywhere" beats "Offline Mode") (Tidal, Vimeo)
- Show the actual product early — screenshots, demo video, or interactive demos with realistic pre-filled data — so users picture themselves using it (SavvyCal, Optimizely, GetResponse)
- Pair the headline benefit with the mechanism that delivers it (GetResponse)
- Lead with the most differentiating feature, not generic capabilities (Inbox, Tidal)
- Use aspirational, emotionally resonant imagery aligned with the value prop (Instagram, Eventbrite, Basecamp)
- Address likely objections proactively at the moment they arise (Shopify, Optimizely, Slack "unlimited users, free forever")
- Repeat the value prop at multiple checkpoints through the flow, not just the landing page (StickerMule, Slack, Evernote)
- Segment messaging and CTAs by user type or use case (Kickstarter creators vs funders, Shopify beginners vs experts)
- Show demonstrations over claims — let users experience a technical advantage instead of reading about it (Tidal audio comparison)

### Anti-patterns

- Vague or abstract value props ("Find your next experience", "business relationships") that fail to state what the product does (Eventbrite, Zendesk, Rdio)
- Circular or tautological messaging ("Gmail has the ease & simplicity of Gmail") and overly broad "handles everything" claims (Gmail, ClickUp)
- Decorative visuals and metaphors that don't connect to product value (abstract gradients, farm animals, earth-and-stars imagery) (PayPal, Zendesk, Quora, Duolingo)
- Omitting the value prop on entry/login screens on the assumption of brand familiarity (Skype, Snapchat, Virgin America)
- Gating product information behind signup with no way to preview or explore first (Pocket, Trello, United, Basecamp)
- Auto-rotating or auto-shifting carousels that move while users read (GetResponse, Vimeo, Gmail)
- Burying core differentiators in small body text instead of headlines (Zendesk, LiveChat)
- Verbose value-prop copy that users skip; keep it scannable (AppleMusic, SuperMarioRun)

## 2. Trust, social proof and legal

### Good practices

- Use testimonials with full identity context — photo, name, role, company (InVision, Trello, LessAccounting)
- Borrow credibility via recognizable customer and press logos (InVision, GetResponse, Optimizely)
- Show scale metrics (user counts, funding totals) as social proof near conversion points (ClickUp, Kickstarter, Zapier)
- Distribute social proof across the whole journey and at decision moments (pricing, upgrade modals), not one section (StickerMule, Canva, Optimizely)
- Stack trust signals at sensitive steps: security badges, accepted payment logos, lock icons, encryption messaging (Netflix, LessAccounting, Zapier)
- Offer risk reversal with specific terms — free trial length, no credit card required (Shopify, QuickBooks, Basecamp)
- Explain security in resonant plain language ("bank-level security") rather than jargon (SSL, PCI) (Shopify, Basecamp)

### Anti-patterns

- Testimonials without identifying context, or clustered so densely they overwhelm (LiveChat, Trello)
- Security theater: fake badges, generic lock icons without explanation, over-repeated reassurance that reads as insincere (AshleyMadison, Hulu, Unrollme)
- Bold outcome claims with no citations or evidence (GetResponse)
- Dense legal text (EULA/ToS) mid-onboarding, or "I Agree" offered before the option to read the terms (Waze, Dropbox, Evernote)
- Terms acceptance as a blocking dead-end checkpoint at the moment of highest motivation (Skype, SuperMarioRun, AppleMusic)
- End-of-flow legal disclaimer walls that obscure the actual completion point (OregonSNAP, PayPal)

## 3. Signup and account creation

### Good practices

- Minimize required fields to essentials — 2-3 fields is achievable (Slack, Tumblr, Netflix, Musically)
- Offer social/SSO login alongside email, at signup not just sign-in (Canva, WordPress, SavvyCal)
- Split long signup into small, single-purpose steps with progressive disclosure (Evernote, Virgin America, PayPal, Twitter)
- Let users experience core value before requiring an account (Duolingo full lesson before signup; United booking without enrollment)
- Ask for the account only after initial momentum is built (Duolingo)
- Auto-focus the first field; pre-fill from available context — OAuth profile, Gravatar, email domain, device locale (Slack, ClickUp, WhatsApp, Zendesk)
- Auto-submit or auto-advance when all required inputs are validly complete (Canva, ClickUp, AshleyMadison)
- Strip navigation and distractions from form pages (Amazon-checkout focus mode) (Evernote)
- Provide a visible "Log in" path for existing users on signup screens, and vice versa (Unrollme, United)
- Confirm critical entries (email address) with easy correction paths (Slack, Instagram, WhatsApp)

### Anti-patterns

- Blocking progress on email verification mid-flow; forcing users out to their inbox breaks momentum (Asana, Eventbrite, Meetup, WordPress, Zendesk)
- Re-asking for information already collected earlier in the flow (ClickUp, Eventbrite, Canva, Yo)
- Requiring login or re-authentication immediately after account creation in the same session (United, OregonSNAP)
- Collecting optional or deferrable data at signup that could be gathered later with more context (Asana, Foursquare, Virgin America)
- Excessive field counts and 10+ field mobile forms without splitting or progress indication (Gmail, United, PayPal)
- Redundant confirmation fields (password confirmation) and double password creation (Hulu, Eventbrite)
- Ambiguous labels like "New password" during first signup (Snapchat, Eventbrite)
- Stacked sequential verification barriers without clear necessity (Snapchat, Waze)

## 4. Forms, input and validation

### Good practices

- Display password and field requirements upfront, inline with the field — never make users guess (QuickBooks, OregonSNAP, PayPal, LiveChat)
- Provide real-time inline validation with visual indicators (checkmarks, color states) (AshleyMadison, Instagram, Waze, SavvyCal)
- Use encouraging password-strength meters with progressive feedback (QuickBooks, Dropbox, Zapier)
- Match input method to data type: email keyboards, numeric pads (Asana, Yo)
- Pre-fill smart defaults users can override — country from locale, username from profile, title from filename (SuperMarioRun, Waze, Vimeo, WhatsApp)
- Add inline helper text explaining why data is needed and how it benefits the user (PayPal, Slack, Shopify, Snapchat)
- Use third-party APIs to autocomplete multi-field data (address from Google Maps; country from IP) (Eventbrite, Zapier)
- Auto-correct unsupported characters and auto-format dates/phones instead of rejecting input (SavvyCal, OregonSNAP)
- Validate on blur with errors clearing dynamically as users correct them; never error before they finish typing (Virgin America, SavvyCal, ClickUp)
- Show character counts and expected length/format for open-ended fields (Eventbrite)
- Mark required vs optional consistently and honestly (Foursquare, Kickstarter, QuickBooks)
- Suggest alternatives when a username or value is unavailable (Waze)
- Break long forms into themed screens with review/summary checkpoints (PayPal, OregonSNAP)

### Anti-patterns

- Revealing validation rules only after a failed submission, forcing trial-and-error (Virgin America, Tidal, Musically, Pocket)
- Vague field labels without context ("Greeting", "ZIP", "responsibility") (AshleyMadison, StickerMule, OregonSNAP)
- No real-time availability feedback on usernames (Musically, Skype)
- Error messages that persist after the user has corrected the input (SavvyCal)
- Generic error buttons ("Fix Password") without stating the specific failure (Virgin America)
- Overly strict password requirements that frustrate more than protect (Virgin America)
- Identical styling for elements with different behaviors — inputs that look like buttons, fields that look like labels (Rdio, Waze, Asana)
- Truncating realistic input lengths (10-digit phone numbers) (Yo)
- Dynamically adding fields during completion, creating the illusion of growing complexity (QuickBooks)

## 5. Permissions and notification requests

### Good practices

- Request permissions at the moment of use, triggered by a user action that needs them ("Choose Photos" tap before camera-roll access) (Dropbox, Musically, Periscope, Peach)
- Prime before the OS dialog: explain the concrete benefit in-app first — grant rates rise when users want to say yes (Waze, Quartz, Foursquare, Timehop)
- Time requests after positive moments or invested effort, when users are in an accepting mindset (Hillary2016, Unrollme)
- Include privacy reassurance and data-usage transparency alongside sensitive requests ("we DO NOT store your typing info") (Kimoji, Snapchat, Skype, Yo)
- Provide fallback and retry paths when permission is denied so users can continue (Dropbox)
- Let users skip optional permissions and still proceed with the primary action (Periscope, Timehop)

### Anti-patterns

- Requesting permissions at app launch before users understand the value (United, Waze, Asana, Headspace)
- Chaining multiple permission requests in rapid sequence — permission fatigue drives rejections (United, Musically, Hillary2016pt2)
- Abrupt, context-free requests, especially when the permission isn't obviously tied to core functionality (Kimoji, Peach, Yo)
- Replacing native system prompts with custom modals that break platform conventions (Headspace)
- Manipulative emotional priming to extract consent instead of direct transparency (Virgin America)
- No graceful decline path — requiring acceptance to continue at all (Yo)

## 6. First-run experience and time-to-value

### Good practices

- Get users to core value fast; minimize steps between install and the "aha" moment (SuperMarioRun2, Rdio music playing immediately, Hulu)
- Teach by doing: hands-on tasks in the real product beat passive carousels and videos (Duolingo, Gmail send-first-email, Quartz, Peach)
- Use the product itself as the onboarding surface — embed guidance in the actual interface users will work in (Quartz, Basecamp, ClickUp, Trello)
- Make the first task trivially easy to build momentum before harder steps (GetResponse, Hillary2016, OkCupid)
- Do productive work in the background during onboarding so waits feel valuable (Unrollme account scanning)
- Suppress secondary features, integrations, and product news until after core value is experienced (Dropbox, Evernote, Zendesk)
- Structure setup as a flexible checklist users complete in any order, rather than a forced linear wizard (QuickBooks, Dropbox, Zendesk)
- Invest in interfaces intuitive enough to need little onboarding — design as teaching (IF, Instagram, Inbox)

### Anti-patterns

- Front-loading long mandatory setup (region pickers, profiles, agreements, preference screens) before any core product exposure (Timehop, SuperMarioRun, Tidal, Headspace)
- Lengthy intro videos or narrative exposition blocking first interaction (Headspace 2-minute video, SuperMarioRun cutscenes)
- Extended tutorial carousels users just want to skip; passive swiping disguised as hands-on learning (Musically, Tidal, Inbox, Periscope)
- Routing users out of the app (system settings, external apps, email) mid-onboarding, fragmenting attention (Pocket, Kimoji, Yo, Twitter)
- Explaining advanced or tertiary features before users understand the primary workflow (Tidal, Gmail, Basecamp)
- Onboarding steps that are busywork — empty gestures, redundant repeats of screens already seen (ClickUp, Foursquare)

## 7. Tours, tooltips and guided tutorials

### Good practices

- Make tours optional with clear entry points and explicit exits ("Done" button, skip) (Optimizely, Zendesk)
- Prefer inline contextual tips within the real workflow over separate tutorial screens (Buffer, Kickstarter, Vimeo)
- Advance tour steps only on explicit user confirmation, never as side effects of other interactions (Optimizely)
- Style instructional UI distinctively (color, contrast) so it reads as temporary guidance, not product chrome (LiveChat, Tidal)
- Favor persistent, revisitable guidance (checklists, help menus) over one-shot tooltips users won't remember (QuickBooks, PayPal, WordPress)
- Show one guidance element at a time — sequential, not stacked layers (Slack, Evernote, ClickUp)

### Anti-patterns

- Tooltips that obscure the element they explain or block the next required action (Optimizely, WordPress, Slingshot)
- Trapping users in tours with no obvious way out (Optimizely, Hillary2016)
- Stacking multiple sequential tours — tour fatigue makes users skip everything (Zendesk)
- Information-dump tooltip walkthroughs; they're brittle across contexts and forgotten by next session (Optimizely, QuickBooks)
- Teaching content after the user already performed the action, or explaining mechanics text could show (Snapchat, SuperMarioRun2)
- Nested UI layers during tours (tooltips atop modals) that confuse what to interact with (Optimizely)
- Tooltips that merely point at UI elements instead of guiding an actionable workflow toward user value (Zendesk)

## 8. Empty states and sample content

### Good practices

- Design empty states to explain what will appear there and give a prominent next-step CTA (Pocket, GetResponse, IF)
- Preload realistic sample content that doubles as tutorial and usable resource (Basecamp sample project, Trello example boards, Gmail seeded inbox)
- Make demo data deep and lived-in — rich activity feeds and realistic detail build confidence (InVision 26-screen demo project)
- Pre-seed contacts or test accounts so social/communication products work on first touch (Skype Echo test call, Snapchat Team account)
- Offer curated templates and presets instead of blank-slate creation (IF, Pinterest, Eventbrite, Canva)

### Anti-patterns

- Bare empty states with no guidance, explanation, or action (Dropbox, Waze "No friends", Timehop, LiveChat)
- Generic placeholder content ("Task 1", "Task 2") instead of relevant examples (ClickUp)
- All-zero dashboards that feel hollow; show meaningful values or samples (QuickBooks)
- Empty-state copy that only states the obvious absence, or tells users WHAT to do without HOW (IF, Shopify)

## 9. Copywriting, tone and CTA labels

### Good practices

- Write specific, outcome-describing button copy ("Take me to my store", "Start Listening Free") — engineering cost is identical to "OK", confidence is not (Shopify, Rdio, PayPal)
- Make CTAs benefit-driven ("GET 3 MONTHS OF FREE MUSIC" vs "Continue") (AppleMusic, Zapier, SavvyCal)
- Use conversational, personality-driven microcopy throughout to humanize the flow (Slack, Tumblr, Quartz, Buffer)
- Frame copy from the user's perspective, first person where natural ("I want to learn...") (Duolingo, Periscope, AshleyMadison)
- Prefer plain, colloquial language over jargon ("files" not abstractions; "Basic Economy" needs explaining) (Dropbox, Tidal, United)
- Define new terminology and system vocabulary at first encounter, in context (Pinterest, Duolingo XP, Peach)
- Keep naming consistent for the same concept across steps (Foursquare, Zapier row/record, Waze)
- Split voice deliberately: product voice in static copy, user voice in interactive elements ("I agree") (Skype)
- Match tone and formality to the audience — playful for games, professional for B2B (SuperMarioRun, ClickUp)

### Anti-patterns

- Generic labels — "Next", "Continue", "OK", "Done" — that don't predict what happens (Quartz, Mailbox, SavvyCal, Unrollme)
- Ambiguous buttons whose consequences can't be predicted ("Explore this later", "Let's go!", "Get Started" meaning skip) (AppleMusic, Hillary2016, Musically)
- Unexplained acronyms, jargon, or technical terms (LIHEAP, "IE 8.x", "digital HQ") (OregonSNAP, Hillary2016, Bitcoin)
- Misleading effort/time claims ("seconds away", "one line of code", "almost done" when it isn't) (Optimizely, AshleyMadison, Trello)
- Vague filler words ("stuff", "good stuff") instead of specific terminology (Twitter, Dropbox)
- Renaming familiar concepts without migration guidance (Archive→Done, Stars→Pins) (Inbox)
- Repeating identical CTA text across distinct steps, blurring progress (Foursquare, Unrollme, WordPress)

## 10. Visual hierarchy and consistency

### Good practices

- One visually dominant primary CTA per screen, secondary actions clearly de-emphasized (Basecamp, Netflix, Buffer)
- Keep branding and design consistent from marketing site through signup into the app — jarring shifts feel like a different product (Peach, SavvyCal, Zendesk, Hillary2016)
- Use whitespace generously to focus attention on what matters (Buffer, Gmail, Duolingo)
- Use motion and pulsing indicators sparingly to direct attention — motion equals attention (SavvyCal, Canva, AshleyMadison)
- Pair icons with text labels; don't rely on icon recognition (Foursquare)
- Prefer native platform controls over custom replacements unless you can match platform quality (SuperMarioRun, Headspace)

### Anti-patterns

- Multiple competing CTAs with equal visual weight, creating decision paralysis (Trello, Slack, Peach)
- Reversed hierarchy: secondary, cancel, or destructive actions more prominent than the primary action (AppleMusic, OregonSNAP, Yo)
- Low-contrast or tiny text for important supporting information (Buffer, Periscope, Trello)
- Hidden affordances: hover-only controls, unlabeled ambiguous icons, undiscoverable gestures with no hints (Rdio, Inbox, Slingshot, Kickstarter)
- Decorative backgrounds and elements that compete with content for attention (Slack, LiveChat)
- Inconsistent interactive states (hover effects on some elements, absent on others; buttons appearing/disappearing) (Slack, Instagram)
- Placing interactive elements in unexpected locations, forcing users to hunt (Shopify)

## 11. Personalization and segmentation

### Good practices

- Ask about user goals early and visibly use the answers to tailor the rest of the flow (WordPress, Zapier, Canva)
- Explain upfront how collected data enables customization or benefits the user (Canva, Shopify, Rdio)
- Deliver an immediate, visible personalization payoff (favorite artist plays right after setup; templates carry the user's logo and colors) (Rdio, Canva, Zapier)
- Recap user-provided preferences back to them to demonstrate understanding (Zapier)
- Make qualification questions skippable, with honest options like "I don't know" or "just browsing" (ClickUp, Zapier, Canva)
- Infer defaults from device/context — location, platform, language — instead of asking (OkCupid, Meetup, SuperMarioRun, Eventbrite)

### Anti-patterns

- Sales qualification disguised as personalization — demographic farming that never improves the user's experience (ClickUp, Zapier, Canva)
- Collecting preference data then producing generic results that ignore it (AppleMusic, Netflix, Zapier AI recommendations)
- Asking the same demographic question twice under different framing (Canva, WordPress)
- Recommending content the user explicitly rejected during setup (Netflix)
- Business-facing questions ("how did you hear about us?") before first user value (SavvyCal)
- Requesting preference and taste data before users have engaged with core features (Virgin America, Pinterest)
- Segmentation categories that contradict product positioning or don't match the user base (Canva "for everyone" but teams-only questions)

## 12. Progress, feedback and celebration

### Good practices

- Show progress indicators in every multi-step flow — steps, counters, bars — so users know where they are and what remains (Quora, Meetup, OregonSNAP, Dropbox)
- Exploit the endowed progress effect: pre-credit already-completed steps (start at 3/8, not 0/5) (WordPress, Zendesk, Hillary2016, Quora)
- Give immediate positive feedback on every action — checkmarks, state changes, confirmations (Duolingo, Tumblr, Zendesk)
- Update progress copy and counters in real time as tasks complete (Shopify, Tumblr)
- Celebrate milestones with genuine ceremony — confetti, congratulatory modals, celebratory copy (Canva, Kickstarter, Hillary2016pt2)
- State explicitly what was accomplished in success confirmations, plus next steps (Bitcoin, Eventbrite, PayPal)
- Quantify achievements to make impact tangible (emails unsubscribed, tasks done) (Unrollme)

### Anti-patterns

- Missing progress indication in multi-step flows, leaving users uncertain how much remains (OkCupid, Meetup, Kickstarter)
- Artificially inflated or false progress — counting steps not started, congratulating milestones not reached (Bitcoin, Canva, Zendesk)
- Progress bars that complete before the content does, killing motivation to continue (Duolingo)
- Cold, uncelebrated transitions out of onboarding — no completion acknowledgment (OkCupid, Netflix, Quora)
- Repeated "almost done" messaging while substantial work remains — erodes credibility (AshleyMadison)
- No completion indicator on bounded tasks, so users overshoot goals (OkCupid rate-10 task)
- Tracking intent (button clicks) rather than actual completion (Zendesk)

## 13. Gamification and rewards

### Good practices

- Build progression systems that visualize growth from real usage (Waze Baby Wazer levels, OkCupid milestones)
- Make the first challenge quick and winnable, then ramp difficulty gradually (Hillary2016, OkCupid, Duolingo)
- Be generous with virtual rewards — they cost nothing and abundance feels good (Hillary2016)
- Unlock features as milestone rewards to create progression pull (OkCupid, Rdio)
- Vary activity types (quizzes, ratings, exercises) to prevent monotony (OkCupid, Duolingo)
- Explain reward mechanics (XP, points, streaks) at the moment users first earn them (Duolingo)

### Anti-patterns

- Unexplained reward currencies users can't value ("gold stars", "candy" with no stated purpose) (Hillary2016pt2, Waze)
- Rewards disconnected from real-world outcomes — celebrating busywork inflates trivial accomplishments and erodes trust (Hillary2016pt2 virtual office furniture)
- Circular reward loops (earn stars to buy items to earn more stars) with no external meaning (Hillary2016pt2)
- Tasks kept too simple for too long — users disengage without challenge (Duolingo, SuperMarioRun2)

## 14. Loading, performance and error handling

### Good practices

- Always show explicit loading states with descriptive status text ("Saving...", "Scanning account") — never silence (Buffer, Unrollme, Hulu)
- Use skeleton UI shaped like the incoming content to orient users to the future state, not the wait (QuickBooks)
- Reinforce value props and rotate messages on longer loading screens (QuickBooks, Vimeo)
- Update status dynamically as processing genuinely advances ("Waiting in line" → "Converting, 43%") (Vimeo, WhatsApp)
- Disable submit buttons and show progress during processing to prevent duplicate submissions (Optimizely, StickerMule)
- Write specific, actionable error messages with inline recovery options (retry buttons, exact requirements) (Optimizely, Musically, Pocket)
- Treat speed as a feature — fast loads and uploads at critical moments build quality perception (Periscope, WhatsApp, Yo)

### Anti-patterns

- No feedback after button clicks, leaving users unsure anything happened (Netflix, Slack, Hulu)
- Bare spinners with no context or timeout; persistent spinners without completion feedback (Yo, Tidal)
- Excessive waits without reassurance; 10-second loads feel broken (Quora, United, QuickBooks)
- Generic failure copy ("Sorry, something went wrong") with no recovery guidance (United)
- Error-styled treatment for routine, expected states — reserve alarm styling for genuine risk (OregonSNAP, Waze, GetResponse)
- Unexplained transitions or flashes to unrelated screens mid-flow — users lose trust the flow is working (AppleMusic)

## 15. Social features, invitations and virality

### Good practices

- Time sharing and referral prompts right after success moments, when goodwill is highest (StickerMule, Unrollme, Hillary2016)
- Pre-fill referral messages (recipient, subject, body) and send from the user's own account for trust and deliverability (Mailbox)
- Highlight contacts already on the platform and offer one-tap invites for the rest (WhatsApp, Yo)
- Provide multiple friend-discovery pathways (contacts, social platforms, location) with a skip option (Waze, Musically)

### Anti-patterns

- Requesting invitations or team collaboration before the user has experienced any product value (ClickUp, GetResponse, Unrollme)
- Auto-suggesting contacts without regard to relationship context (professional vs personal) — privacy risk (Slingshot)
- Making social features mandatory with no standalone alternative (Waze)
- Multi-step manual referral flows (copy URL, type addresses) that kill viral mechanics (Mailbox)

## 16. Email and re-engagement

### Good practices

- Delay welcome and transactional emails a few minutes so they don't compete with the critical first-run moments (Dropbox, United, PayPal)
- Send welcome emails with actionable next steps, tips, and support channels (Buffer, Mailbox)
- Drip feature education through a short sequence of focused emails, one capability each (Gmail)
- Put one prominent, easy-to-click CTA button in transactional emails to sustain momentum (Bitcoin, Meetup)
- Use transactional emails to keep users engaged during long async processing (order production, review queues) (StickerMule)

### Anti-patterns

- Emailing during active signup/onboarding — notifications interrupt the flow you're trying to complete (Dropbox, PayPal, Pocket)
- "Check your email" redirects before momentum solidifies (Slack, WordPress)
- Ads or cross-promotions inside onboarding email flows (Gmail)
- Weak subject lines and unclear link destinations in onboarding emails (Mailbox)

## 17. Monetization, pricing and upsells

### Good practices

- Make pricing, trial terms, and exact trial-end/cancellation dates explicit at the point of decision (Netflix, Hulu, Tidal, Canva)
- Present tiers side-by-side with clear feature matrices; anchor with higher tiers first (Basecamp, Shopify, Optimizely)
- Defer payment requests until users have demonstrated commitment through meaningful setup (Shopify, Optimizely)
- Keep upgrade paths visible but non-aggressive — consistent premium markers (crown icons) and contextual CTAs instead of interruptions (Buffer, Canva, Zapier)
- Provide functional free fallbacks when premium features are gated so users can still progress (Canva basic Crop vs Magic Expand)
- Show total price including taxes/fees upfront; no surprise costs at checkout (United)
- Surface contextually relevant cross-sells at natural moments (print offer at download time) (Canva, Zapier)

### Anti-patterns

- Requiring billing details before trial access (GetResponse)
- Misleading upgrade modals implying features are exclusive to a higher tier than reality (Canva)
- Aggressive upsells immediately after conversion or before users have explored value (Canva Teams push post-Pro purchase, Zapier upgrade prompts at trial start)
- Advertising monthly pricing then billing yearly at checkout, or showing monthly-equivalents that obscure true cost (Zapier)
- Paywalls appearing right after engagement was earned — bait-and-switch perception (AshleyMadison, Tidal)
- Overly complex pricing pages with tiers plus add-ons causing analysis paralysis (QuickBooks)
- Urgency/FOMO language in confirmation flows for high-commitment purchases (Bitcoin)
- Unverifiable "Most Popular" labels used as a pure sales tactic (GetResponse)

## 18. Ending onboarding and handoff to exploration

### Good practices

- Define a clear endpoint for guided onboarding, then transition explicitly to self-directed exploration (Canva, Evernote, Foursquare)
- Close the loop with a real core action — send the first email, publish the first automation — not more reading (Gmail, IF, Optimizely)
- Land users in immediate, personalized value that reflects their onboarding choices (Hulu, Rdio, AppleMusic)
- Offer concrete next steps and multiple logical paths after every major completion, including post-purchase (Bitcoin, Eventbrite, Zapier)
- Know when to stop — ending cleanly beats continuous prompting (Asana)
- Keep guidance re-accessible after onboarding: persistent checklists, help menus, in-app guidance (WordPress, PayPal, QuickBooks)
- Have the first session produce a meaningful artifact that resurfaces later as a retention hook (IF first automation)

### Anti-patterns

- Abandoning users at completion — abrupt endings with no direction on what to do next (ClickUp, Pinterest, Evernote)
- The guidance cliff: removing checklists and tooltips with no persistent aids remaining (WordPress)
- Static dead-end screens after primary actions, with no progression or engagement hooks (Tidal player, Timehop)
- Treating success confirmations as endpoints instead of springboards to next actions (Zapier, StickerMule)
- Redirecting momentum away from the product right after signup (external sites, consumption views for creators) (Slack, Meetup, Vimeo)
