<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, Link } from '@inertiajs/vue3';
import { useForm } from "@inertiajs/vue3";
defineProps({
    errors: Object,
    user: Object
})
const form = useForm({
    title: "",
    dueDate: "",
    status: "pending",
    userId: "",
    description: ""

});
const submit = () => {
    const res = form.post("/tasks");
    if (res) {
        form.reset();
    }
};

</script>

<template>

    <Head title="Task Create" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Tasks</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-1  px-1 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg lg:px-5 py-2 px-1">
                    <div class="flex justify-end">
                        <Link :href="route('tasks.index')"
                            class="rounded px-10 py-1 text-white bg-red-600 hover:bg-red-700">
                        Cancel
                        </Link>
                    </div>
                    <div v-if="$page.props.flash.message" class="alert">
                        {{ $page.props.flash.message }}
                    </div>
                    <div class="w-full mt-2">
                        <form @submit.prevent="submit">
                            <div class="grid grid-cols-1 lg:grid-cols-2">
                                <div class="mb-2 mt-2 px-1">
                                    <label for="first-name"
                                        class="block text-sm font-medium leading-6 text-gray-900">Title</label>
                                    <div class="mt-2">
                                        <input type="text" name="title" id="title" v-model="form.title"
                                            class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" />
                                    </div>
                                    <div v-if="errors.title" class="text-red-600">{{ errors.title }}</div>
                                </div>
                                <div class="mb-2 mt-2 px-1">
                                    <label for="first-name"
                                        class="block text-sm font-medium leading-6 text-gray-900">Due
                                        date</label>
                                    <div class="mt-2">
                                        <input type="date" name="dueDate" id="dueDate" v-model="form.dueDate"
                                            class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" />
                                    </div>
                                    <div v-if="errors.dueDate" class="text-red-600">{{ errors.dueDate }}</div>
                                </div>
                                <div class="mb-2 mt-2 px-1">
                                    <label for="about"
                                        class="block text-sm font-medium leading-6 text-gray-900">Description
                                    </label>
                                    <div class="mt-2">
                                        <textarea id="description" v-model="form.description" name="description"
                                            rows="3"
                                            class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" />
                                    </div>
                                    <div v-if="errors.description" class="text-red-600">{{ errors.description }}</div>
                                </div>
                                <div class="mb-2 mt-2 px-1">
                                    <label for="first-name"
                                        class="block text-sm font-medium leading-6 text-gray-900">Assign To
                                        User</label>
                                    <div class="mt-2">
                                        <select id="user_id" name="user_id" v-model="form.userId"
                                            class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600  sm:text-sm sm:leading-6">
                                            <option value="">select user assign</option>
                                            <option v-for="(list, index) in user" :key="index" :value="list.id">
                                                {{ list.name }}
                                            </option>
                                        </select>
                                    </div>
                                    <div v-if="errors.userId" class="text-red-600">{{ errors.userId }}</div>
                                </div>
                            </div>
                            <div class="flex justify-start mt-2 mb-2">
                                <!-- <button class="rounded px-10 py-1 text-white bg-blue-600 hover:bg-red-700">
                                    Save
                                </button> -->
                                <button class="rounded px-10 bg-green-600 text-white hover:bg-green-700 py-1"
                                    type="submit">Save</button>
                            </div>

                        </form>

                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
