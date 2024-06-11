const admin = require("firebase-admin/app");
admin.initializeApp();

const updateBarangayStats = require("./update_barangay_stats.js");
exports.updateBarangayStats = updateBarangayStats.updateBarangayStats;
