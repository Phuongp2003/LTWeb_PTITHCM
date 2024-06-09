package ptithcm.bean;

import java.util.List;

public class BreadCrumb {
    public class Link {
        public String url;
        public String name;

        public Link() {
            this.url = "";
            this.name = "";
        }

        public Link(String url, String name) {
            this.url = url;
            this.name = name;
        }

        public String getUrl() {
            return url;
        }

        public String getName() {
            return name;
        }

        public void setUrl(String url) {
            this.url = url;
        }

        public void setName(String name) {
            this.name = name;
        }
    }

    private List<Link> preLinks;
    private Link currentLink;

    public BreadCrumb() {
        this.preLinks = new java.util.ArrayList<>();
        this.currentLink = new Link();
    }

    public BreadCrumb(List<Link> preLinks, Link currentLink) {
        this.preLinks = preLinks;
        this.currentLink = currentLink;
    }

    public List<Link> getPreLinks() {
        return preLinks;
    }

    public void setPreLinks(List<Link> preLinks) {
        this.preLinks = preLinks;
    }

    public Link getCurrentLink() {
        return currentLink;
    }

    public void setCurrentLink(Link currentLink) {
        this.currentLink = currentLink;
    }

    public void addPreLink(String url, String name) {
        Link link = new Link();
        link.url = url;
        link.name = name;
        preLinks.add(link);
    }

    public void setCurrentLink(String url, String name) {
        Link link = new Link();
        link.url = url;
        link.name = name;
        currentLink = link;
    }

    public void removePreLink() {
        preLinks.remove(preLinks.size() - 1);
    }

    public void clearPreLinks() {
        preLinks.clear();
    }

    public void clear() {
        preLinks.clear();
        currentLink = null;
    }
}
