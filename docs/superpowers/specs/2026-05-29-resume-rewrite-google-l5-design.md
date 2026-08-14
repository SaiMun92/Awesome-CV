# Resume Rewrite for Google L5 — Design Spec

**Date:** 2026-05-29  
**Target:** Google L5 Software Engineer / Full Stack Engineer / Cloud Engineer  
**Output:** Three tailored `.tex` resume variants

---

## Goal

Rewrite Sai Mun Lee's CV to maximize chances of landing a Google L5 interview. Produce three variants tailored to different L5 tracks, all using the existing Awesome-CV LaTeX template.

## Context

- **Candidate:** 8+ years experience, currently Lead SWE / Co-Product Owner at SAP Asia
- **Key strengths:** ML platform architecture, distributed systems at scale (8B+ recommendations), cloud infrastructure (AWS/GCP/Terraform certified), technical leadership (15-person team)
- **Target level:** L5 (Senior Software Engineer) — requires demonstrating independent ownership of complex technical projects with broad impact

## Resume Structure (all variants)

1. **Header** — Name, contact info (unchanged)
2. **Summary** (new) — 2-line positioning statement, tailored per role
3. **Skills** — Reordered per variant to front-load relevant technologies
4. **Experience** — Rewritten using Google's XYZ formula ("Accomplished X as measured by Y, by doing Z")
5. **Certificates** — Unchanged
6. **Education** — Unchanged

## File Structure

```
saimun-resume/
├── cv.tex                    (SWE/Backend variant - default)
├── cv-fullstack.tex          (Full Stack variant)
├── cv-cloud.tex              (Cloud Engineer variant)
├── cv/
│   ├── summary-swe.tex
│   ├── summary-fullstack.tex
│   ├── summary-cloud.tex
│   ├── skills-swe.tex
│   ├── skills-fullstack.tex
│   ├── skills-cloud.tex
│   ├── experience-swe.tex
│   ├── experience-fullstack.tex
│   ├── experience-cloud.tex
│   ├── certificates.tex      (unchanged)
│   └── education.tex         (unchanged)
```

---

## Content Per Variant

### Summary

**SWE / Backend:**
> Senior Software Engineer with 8+ years of experience designing and scaling distributed systems. Specializes in ML platform architecture, multi-tenant services, and building systems that serve billions of requests at enterprise scale.

**Full Stack:**
> Senior Full Stack Engineer with 8+ years of experience building end-to-end platforms from API design to production deployment. Specializes in developer-facing ML platforms, scalable REST APIs, and cross-functional team leadership.

**Cloud Engineer:**
> Senior Cloud Engineer with 8+ years of experience architecting and operating production infrastructure across AWS, GCP, and Kubernetes. Specializes in multi-tenant platform design, IaC (Terraform), and ML workload orchestration at enterprise scale.

---

### Skills

**SWE / Backend:**

| Category | Skills |
|----------|--------|
| Languages | Python, Go, TypeScript, JavaScript, Bash, C/C++ |
| Backend | FastAPI, Flask, Django, Express.js, PostgreSQL, HANA DB, ElasticSearch |
| Infrastructure | Kubernetes, Docker, Cloud Foundry, Jenkins, Terraform |
| Cloud | AWS (Solutions Architect Pro), GCP (Associate Cloud Engineer) |
| Practices | System Design, Distributed Systems, TDD, Agile, Code Review |

**Full Stack:**

| Category | Skills |
|----------|--------|
| Languages | Python, TypeScript, JavaScript, Go, Bash |
| Backend | FastAPI, Flask, Django, Express.js, PostgreSQL, HANA DB |
| Frontend | React, Next.js, Redux, Jest |
| Infrastructure | Kubernetes, Docker, Cloud Foundry, Jenkins, Terraform |
| Cloud | AWS (Solutions Architect Pro), GCP (Associate Cloud Engineer) |
| Practices | API Design, TDD, Agile, Technical Documentation |

**Cloud Engineer:**

| Category | Skills |
|----------|--------|
| Cloud | AWS (Solutions Architect Pro), GCP (Associate Cloud Engineer), SAP AI Core |
| Infrastructure | Kubernetes, Docker, Terraform, Cloud Foundry, Jenkins |
| Observability | Dynatrace, Kibana, Distributed Tracing, Alerting |
| Languages | Python, Go, Bash, TypeScript |
| Backend | FastAPI, Flask, PostgreSQL, HANA DB |
| Practices | Infrastructure as Code, CI/CD, GitOps, Zero-Downtime Deployments |

---

### Experience

#### SAP Asia — Lead Software Engineer | Co-Product Owner (Dec 2020 - Present, Singapore)

**SWE / Backend bullets:**

1. Architected from scratch SAP's Tabular AI platform — a multi-tenant serving layer for SAP RPT-1, a tabular foundation model that performs few-shot classification and regression without per-task fine-tuning, targeting 10+ enterprise tenants at 100K users each.
2. Designed end-to-end system architecture including API contracts, tenant isolation, model inference orchestration, and lifecycle management, deployed on Kubernetes via SAP AI Core.
3. Led a 15-person engineering team building Personalized Recommendations, an engine that generated 8B+ job recommendations in 2025 serving enterprise customers on SAP SuccessFactors.
4. Architected People Like Me — a standalone microservice leveraging employee clickstream data to train collaborative filtering models and serve real-time recommendations via REST APIs.
5. Designed scalable tenant onboarding APIs and background workers on Cloud Foundry, managing multi-tenant training cycles serving thousands of daily requests.
6. Integrated Dynatrace APM and Kibana logging with correlation ID tracking, reducing mean-time-to-resolution for production incidents.
7. Established CI/CD pipelines (Jenkins), load/stress testing, and comprehensive test coverage (unit/integration/e2e) across the platform.

**Full Stack bullets:**

1-5 same as SWE, then:
6. Designed developer-facing FastAPI and Flask APIs with comprehensive documentation, enabling seamless cross-team integration across SAP's AI ecosystem.
7. Onboarded and mentored engineers on SAP BTP stack, conducting training sessions that reduced new-joiner ramp-up time on platform architecture.
8. Led weekly stakeholder sessions, design reviews, and pair programming to maintain code quality and alignment across frontend and backend teams.

**Cloud Engineer bullets:**

1. Architected from scratch SAP's Tabular AI platform — a multi-tenant serving layer for SAP RPT-1, targeting 10+ enterprise tenants at 100K users each, deployed on Kubernetes via SAP AI Core.
2. Designed and deployed multi-tenant infrastructure on SAP AI Core (Kubernetes), implementing tenant isolation, autoscaling, and resource management for ML inference workloads.
3. Led a 15-person engineering team building Personalized Recommendations, generating 8B+ recommendations in 2025 on SAP SuccessFactors.
4. Architected Cloud Foundry-based microservices with Terraform-managed infrastructure, supporting automated tenant provisioning and training orchestration.
5. Built observability stack integrating Dynatrace APM for performance metrics/alerting and Kibana for centralized logging with distributed tracing.
6. Managed CI/CD pipelines (Jenkins) with automated testing gates, container builds (Docker), and zero-downtime deployments across staging and production environments.
7. Leveraged AWS S3, GCP, and SAP BTP services to build a hybrid-cloud data pipeline for recommendation model training and artifact storage.

---

#### TAU Express — Lead Software Engineer (Apr 2020 - Dec 2020, Singapore)

Same across all variants:
1. Led development of a knowledge management system enabling analysts to retrieve and correlate insights from cybersecurity documents using graph-based relationships.
2. Owned end-to-end delivery: gathered requirements directly from users, designed system architecture, and facilitated communication between users and the development team.
3. Tech: React, Django, Docker, Neo4J, ElasticSearch, Cytoscape.js

---

#### NTU SPIRIT Research Center — Research Engineer (Feb 2018 - Mar 2020, Singapore)

Same across all variants:
1. Developed the Intelligent Case Retrieval System (ICRS) for Singapore's smart nation initiative — a full-stack application (Django, Vue.js) for efficient retrieval of legal documents.
2. Built web crawlers (Selenium, Beautiful Soup) to index Chinese news articles and social media content for document retrieval pipelines.

---

### Certificates (unchanged)

- AWS Certified Solutions Architect – Associate (Dec 2021)
- GCP Associate Cloud Engineer (Feb 2022)
- Hashicorp Certified: Terraform Associate (May 2023)
- AWS Certified Solutions Architect - Professional (In Progress)

### Education (unchanged)

- B.S. in Computer Science (Honours), NTU Singapore, 2013-2017
- Specialisation in Machine Learning & Data Science

---

## Implementation Plan

1. Create variant-specific `.tex` files for summary, skills, and experience sections
2. Create three main `cv-*.tex` files that import the correct variant sections
3. Keep the default `cv.tex` as the SWE/Backend variant
4. Update Dockerfile CMD or add instructions to compile each variant
5. Compile all three and verify output

## Design Decisions

- **Single SAP entry:** Tabular AI is only 5 months old (Jan 2026), splitting would make it look thin. Instead, Tabular AI bullets lead the single entry to showcase current scope.
- **Keep Product Owner title:** User prefers to keep it as it reflects both technical and product leadership breadth.
- **Summary section added:** Google recruiters scan for 6 seconds. A positioning statement immediately signals L5-level scope.
- **XYZ formula:** Google's own hiring documentation recommends this format for impact-driven bullets.
