import { Cube, Home } from "../components/Icons"

type AstroComponent = () => any;

export const Views: {[id: string]: { component: (props: Record<string, any>) =>string, options: { title: string }}} = {}

export const SidebarLinks: {
	[id: string]: { icon: any, link?: string, id: string }
} = {
	"home": {
		icon: Home,
		id: "/home"
	},
	"docs": {
		icon: Cube,
		id: "/docs"
	}
}

export const APIRoutes: Record<string, {
	method: string,
	handler: any,
	id: string
}> = {};

export const Config = {
	title: "StackUnderflow",
	currentView: ""
}