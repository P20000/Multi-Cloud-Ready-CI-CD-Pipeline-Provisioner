<a id="readme-top"></a>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![Unlicense License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<br />
<div align="center">
  <a href="https://github.com/P20000/ci-cd-provisioner">
    <img src="https://i.imgur.com/8QjN4Nl.png" alt="Heraldry" width="80" height="80">   </a>

  <h3 align="center">The Citadel of Continuous Deliverance</h3>
  <h4 align="center">A Grand Tome of Automated Stronghold Construction</h4>

  <p align="center">
    Unfurling the scrolls of ancient wisdom to provision, forge, and deploy the very foundations of modern keeps and fortresses.
    <br />
    <a href="#about-the-grand-tome"><strong>Peruse the Chapters Within »</strong></a>
    <br />
    <br />
    <a href="[Link to Demo Video - e.g., a "Siege Demonstration"]">Witness the Siege (View Demo)</a>
    &middot;
    <a href="https://github.com/P20000/ci-cd-provisioner/issues/new?labels=bug&template=bug-report---.md">Report a Dragon's Scorch</a>
    &middot;
    <a href="https://github.com/P20000/ci-cd-provisioner/issues/new?labels=enhancement&template=feature-request---.md">Request a New Enchantment</a>
  </p>
</div>

<details>
  <summary>Table of Contents (The Chapters Within)</summary>
  <ol>
    <li>
      <a href="#about-the-grand-tome">About The Grand Tome</a>
      <ul>
        <li><a href="#the-royal-architecture">The Royal Architecture</a></li>
        <li><a href="#artisan-tools-employed">Artisan Tools Employed</a></li>
      </ul>
    </li>
    <li>
      <a href="#embarking-upon-the-quest">Embarking Upon The Quest</a>
      <ul>
        <li><a href="#required-artifacts">Required Artifacts</a></li>
        <li><a href="#the-sacred-rituals-of-construction">The Sacred Rituals of Construction</a></li>
      </ul>
    </li>
    <li><a href="#the-flow-of-deliverance">The Flow of Deliverance</a></li>
    <li><a href="#the-great-roadmap">The Great Roadmap</a></li>
    <li><a href="#contributing-to-the-realm">Contributing to the Realm</a></li>
    <li><a href="#the-royal-decree-of-license">The Royal Decree of License</a></li>
    <li><a href="#heralds-and-messengers">Heralds and Messengers</a></li>
    <li><a href="#acknowledgements-and-oaths">Acknowledgments and Oaths</a></li>
  </ol>
</details>

---

## About The Grand Tome

[![Citadel Screenshot][product-screenshot]](https://example.com) Hark, noble adventurer! This grand tome unveils the ancient secrets of forging an automated stronghold – a **Citadel of Continuous Deliverance**. No longer shall squires toil by hand, for these sacred scrolls detail the arcane rituals to provision, enchant, and perpetually provision the very infrastructure upon which our digital kingdoms shall stand.

This project is not merely to build a simple cottage, but to erect an entire **Automated Forge and Barracks** capable of birthing and deploying countless smaller outposts and watchtowers with divine efficiency. It shall stand as a testament to the mastery of **IaC (Infrastructural Arcane Craft)** and **CM (Configuration Magic)**.

### The Royal Architecture

Behold, the very blueprint of our digital dominion, laid out in three pivotal acts:

1.  **The Great Land Grant (Terraform):** From the primordial cloud-mists of **AWS**, we summon forth the very earth for our citadel – mighty EC2 mountains for our artisans (Jenkins server), and mystical Kubernetes strongholds for our deployed garrisons.
2.  **The Enchantment of the Forge (Ansible):** Once the lands are granted, our elder mages of **Ansible** descend. They imbue the bare EC2 stone with ancient spells, installing and configuring the **Jenkins Grand Forge** and empowering it with **Docker Runes**, ready to shape our digital weaponry.
3.  **The March of Deliverance (Jenkins Pipeline):** With the forge enchanted, the **Jenkins Pipeline** (`Jenkinsfile`) becomes the General, orchestrating the forging of applications into sturdy **Docker** containers, and then, through the wisdom of **Ansible** once more, deploying these garrisons into the **Kubernetes** strongholds.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Artisan Tools Employed

Herein lie the enchanted tools and potent magics wielded in the construction of this formidable citadel:

| Category | Tool | Description (Medieval Theme) |
| :--- | :--- | :--- |
| **Cloud Realm** | **AWS** | The boundless Sky-Isles where our digital lands are granted and resources summoned. |
| **Infrastructural Arcane Craft (IaC)** | **Terraform** | The Architect's Quill, inscribing the very blueprint of our realm into repeatable spells. |
| **Configuration Magic (CM)** | **Ansible** | The Grand Enchanter's Staff, laying down rituals to imbue our servers with purpose and tools. |
| **Orchestration of Deliverance** | **Jenkins** | The Grand Master of the Forge, overseeing the creation and dispatch of all digital garrisons. |
| **Containerization Runes** | **Docker** | The Sacred Vessel, binding our applications into deployable, uncorrupted forms. |
| **Garrison Command** | **Kubernetes** | The Council of Elders, managing and scaling our deployed forces within the strongholds. |
| **Linguistic Spellcraft** | **Python** | The Tongue of Serpents, crafting the simple enchantments within our test applications. |

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## Embarking Upon The Quest

To partake in this grand endeavor and witness the magic unfold, follow these ancient edicts.

### Required Artifacts

Before commencing the rituals, ensure these essential artifacts are present in your scrying orb (terminal):

* **AWS Account** & **AWS CLI:** Your charter to the Sky-Isles, with credentials secured.
* **Terraform CLI** (`v1.0.0+`): The Architect's Quill for invoking infrastructural spells.
* **Ansible** (`v2.9+`): The Grand Enchanter's Staff, ready for configuration rituals.
* **Docker** (Local): A lesser forge upon your personal workstation for crafting local vessels.
* **Kubectl** (Optional): A minor scepter for peering into the Kubernetes stronghold (for verification).

### The Sacred Rituals of Construction

The construction unfolds in two solemn ceremonies: the Granting of Land and the Enchantment of the Forge.

#### 1. The Great Land Grant (Terraform)

Journey into the `terraform/` directory, where the foundational scrolls reside. Utter these incantations:

```sh
cd terraform/
terraform init             # Prepare the arcane connections
terraform plan             # Foretell the lands to be granted
terraform apply --auto-approve # Issue the command to shape the earth
```

> **Scribe's Note:** Upon completion, Terraform shall reveal the Public IP of your new Jenkins keep and the location of your sacred SSH key for future communions.

#### 2\. The Enchantment of the Forge (Ansible)

With lands granted, journey back to the `ansible/` scrolls. Update your `ansible/inventory.ini` with the Jenkins Keep's newly revealed IP. Then, chant the grand enchantment:

```sh
cd ../ansible/
# Ensure 'inventory.ini' is imbued with the correct Jenkins Keep IP
ansible-playbook -i inventory.ini main-playbook.yml
```

> **Purpose of the Ritual:** This incantation shall summon forth the `jenkins-setup-role`, installing the necessary Java elixirs, Docker Runes, and the mighty Jenkins Grand Forge itself, ensuring it awakens with the dawn.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## The Flow of Deliverance

Once the Citadel stands, its true purpose unfurls: to ceaselessly deliver new advancements to our digital realm.

### The Endless March of the Pipeline

1.  **Awaken Jenkins:** Open your scrying orb (browser) to `http://<Jenkins_Keep_IP>:8080` and complete the ancient rites of initial Jenkins setup.
2.  **Bind the Pipeline:** Within Jenkins, forge a new Pipeline job. Point it to this very GitHub repository, and it shall heed the `Jenkinsfile` within.
3.  **The Call to Arms:** Make a subtle alteration to your application's scroll (`app/app.py`), commit your change, and push it to the `main` branch of this repository. This acts as the rallying cry.

#### The Stages of Deliverance:

| Stage (Medieval Term) | Tool (Medieval Term) | Description (Medieval Theme) |
| :--- | :--- | :--- |
| **Summon Code Scroll** | Git Scribe | Retrieves the latest wisdom from the GitHub Archives. |
| **Forge & Enshrine** | Docker Artificer | Crafts the new application vessel (Docker Image) and places it in the public library (Docker Hub/ECR). |
| **Deploy Garrison** | **Ansible War Master** | Commands the final deployment, using Ansible's K8s spells to manifest the new garrisons into the Kubernetes strongholds. |

### Witnessing the Triumph

The undeniable proof of your Citadel's might can be observed through:

* **Jenkins Scrying Orb:** The successful (green) completion of the pipeline stages, showing the War Master's pronouncements.
* **The Living Realm:** Refreshing your scrying orb on the application's public address to behold the updated version, now proudly running within the Kubernetes stronghold.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## The Great Roadmap

Our engineers and mages envision further enchantments for this citadel:

- [ ] Implement **S3 Arcane Storage** for Terraform's sacred state scrolls.
- [ ] Upgrade the simple K8s cluster to a grand **AWS EKS** managed dominion.
- [ ] Weave **Testing Enchantments** into the `Jenkinsfile` for early detection of flaws.
- [ ] Transform Jenkins installation from direct Ansible to a **Docker container** within the citadel.
- [ ] Integrate **Nagios Sentinels** for constant vigilance, provisioned by Ansible.

Peruse the [open scrolls of grievances and aspirations](https://github.com/P20000/ci-cd-provisioner/issues) for a full list of proposed enchantments and known dragon scorches.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## Contributing to the Realm

The wisdom of many hands makes a stronger citadel. All contributions, be they grand or humble, are **greatly appreciated**.

Should you possess a new spell or a more efficient ritual, fork this repository and offer forth your pull request. Alternatively, open a scroll of suggestion with the tag "enhancement."

1.  Fork the Repository (Claim your own copy)
2.  Create your Feature Branch (`git checkout -b feature/EpicNewSpell`)
3.  Commit your New Runes (`git commit -m 'Add a new EpicNewSpell'`)
4.  Push to your Branch (`git push origin feature/EpicNewSpell`)
5.  Open a Pull Request (Present your offering)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## The Royal Decree of License

Distributed under the Unlicense License. See `LICENSE.txt` for the full decree.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## Heralds and Messengers

Should you wish to send tidings or seek counsel:

P20000 - [@your\_twitter](https://twitter.com/your_username) - email@example.com

Project Scroll: [https://github.com/P20000/ci-cd-provisioner](https://github.com/P20000/ci-cd-provisioner)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## Acknowledgments and Oaths

We extend our gratitude to those who provided wisdom and inspiration:

* [Best-README-Template](https://github.com/othneildrew/Best-README-Template) - A foundational parchment.
* [Ansible Galaxy](https://galaxy.ansible.com/) - For ancient runic inspiration.
* [Img Shields](https://shields.io) - For crafting the heraldic badges.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

[contributors-shield]: https://img.shields.io/github/contributors/P20000/ci-cd-provisioner.svg?style=for-the-badge
[contributors-url]: https://github.com/P20000/ci-cd-provisioner/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/P20000/ci-cd-provisioner.svg?style=for-the-badge
[forks-url]: https://github.com/P20000/ci-cd-provisioner/network/members
[stars-shield]: https://img.shields.io/github/stars/P20000/ci-cd-provisioner.svg?style=for-the-badge
[stars-url]: https://github.com/P20000/ci-cd-provisioner/stargazers
[issues-shield]: https://img.shields.io/github/issues/P20000/ci-cd-provisioner.svg?style=for-the-badge
[issues-url]: https://github.com/P20000/ci-cd-provisioner/issues
[license-shield]: https://img.shields.io/github/license/P20000/ci-cd-provisioner.svg?style=for-the-badge
[license-url]: https://github.com/P20000/ci-cd-provisioner/blob/main/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/P20000 [product-screenshot]: https://via.placeholder.com/800x400?text=Diagram+or+Screenshot+of+The+Citadel+Architecture
