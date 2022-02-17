---
layout: post
title:  "My Backup Strategy"
date:   2013-04-20
---

As a programmer, an amateur photographer and an avid Internet user I have ended up with a lot of data which is dear to me. Much of the data has been created by me over the last 15 years or so and typically cannot be found elsewhere. I'm a bit of pack rat with my data so having a good backup strategy is very important.

My backup strategy might be a bit overboard for many people but it might inspire some new ideas of how to store your data.

## Current setup

I currently own one computer with any valuable data on it. The computer has two internal hard drives - an SSD and an HDD - and three external hard drives. Internal drives contain the most important data: photographs, software code, archived documents as PDF files and some mementos from yesteryears. External drives contain backups of my CD archive, some rare movies or TV series, an eBook collection and assorted other data.

Because of the large capacity requirements of my data, most of the backups are done with rsync, i.e. I only have the most recent state of the data and not an incremental copy which would have a version history. I use rsync in three different ways:

<ol>
	<li>Each night the most important data is backed up from the internal hard drives to one of my external hard drives. This is done with a Bash script. For those interested in the contents of this Bash script, see <a href="https://gist.github.com/VilleSalonen/5425104">my Gist copy of the script</a>. This is the <strong>on-line on-site</strong> component of the strategy. Having an automated on-line backup solution makes sure that I have a recent backup of my data in case my internal drives malfunction.</li>
	<li>Next, very similar script is executed to back up the same data to a NAS drive located outside my house. Copying is done through an SSH connection to LaCie Network Space II. The NAS drive required some hacking to get SSH enabled on it. I don't remember the exact source for my instructions but for example <a href="http://www.lex-web.net/unlock-lacie-network-space-2allow-ssh/">this article by LexWeb</a> looks very similar to what I did. This is the <strong>on-line off-site</strong> component of the strategy. Having an automated off-site backup solution minimizes the risk to my data caused by for example a fire at my apartment.</li>
	<li>Periodically (read: too rarely) I mirror two of my external hard drives to identical hard drives which I store in a cabinet. Because the data on my external hard drives changes more rarely than the data on the internal drives, it is not that important to do these backups each day. This is the <strong>off-line on-site</strong> component of the strategy which is done to minimize the risk of for example a large thunderstorm causing my on-line hard drives to malfunction.</li>
</ol>

To complement the rsync backups, I use my third external hard drive as a Time Machine backup. Time Machine is an incremental backup solution created by Apple and enables me to go back to a specific version of my data if I accidentally overwrite or corrupt some of the data.


## Where to from here?

Firstly, I dislike having to partition my data on different hard drives. Recently the capacity of the external hard drives has also become a limit. Because of these reasons, I'm planning on investing in HP Microserver which is a small and inexpensive computer with four hard drive bays. This kind of computer with ZFS and its similar-to-RAID solutions would enable me to have a massive external storage with a one- or two-disk redundancy.

Secondly, I've been toying about storing some of data to the cloud but so far this options has been too expensive or too cumbersome. I don't want to give up my unencrypted data to third parties so having an easy way to incrementally and cryptographically securely back up my data is a must.

Finnish association named Kapsi offers 500 gigabytes of storage for 35 euros a year so this would be inexpensive but I haven't yet managed to implement a foolproof system for this backup option.

I've also looked into Amazon's S3 and Glacier solutions but so far S3 has been too expensive for about 300 gigabytes of storage and Glacier's traffic restrictions have been to limiting. Glacier also has a problem with the costs and speed of getting the backups back to my computer.


## In closing

I'm quite happy with my current backup setup. It has already been of use as I have accidentally overwritten or deleted parts of my photography collection.

Hopefully this article inspires you to make sure that your backups are sound. This is especially meant for parents with photographs of their children. I'd hate to hear that your children have to grow up without having any pictures of their childhood because your hard drive failed.
