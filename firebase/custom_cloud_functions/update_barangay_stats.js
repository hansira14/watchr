const functions = require("firebase-functions");
const admin = require("firebase-admin");

const firestore = admin.firestore();

exports.updateBarangayStats = functions.firestore
  .document("voter/{voterId}")
  .onWrite((change, context) => {
    const voterData = change.after.exists ? change.after.data() : null;
    const voterOldData = change.before.exists ? change.before.data() : null;
    const voterbarangay = voterData
      ? voterData.voterbarangay
      : voterOldData
        ? voterOldData.voterbarangay
        : null;

    if (voterbarangay) {
      // Count of all voters in the barangay
      const voterCountQuery = firestore
        .collection("voter")
        .where("voterbarangay", "==", voterbarangay);

      return voterCountQuery.get().then((voterCountSnapshot) => {
        const voterCount = voterCountSnapshot.size;

        // Calculate the other counts based on the initial query
        const memberCount = voterCountSnapshot.docs.filter(
          (doc) => doc.data().affiliation === "Hugpong",
        ).length;
        const memberCheckins = voterCountSnapshot.docs.filter(
          (doc) =>
            doc.data().affiliation === "Hugpong" &&
            doc.data().hasVoted === true,
        ).length;
        const activeMembers = voterCountSnapshot.docs.filter(
          (doc) =>
            doc.data().affiliation === "Hugpong" &&
            doc.data().voterstatus === "ACTIVE",
        ).length;

        // Reference the document in the barangaystats collection with a matching 'name' field
        const barangayStatsRef = firestore
          .collection("barangaystats")
          .where("name", "==", voterbarangay);
        return barangayStatsRef.get().then((querySnapshot) => {
          if (!querySnapshot.empty) {
            // Assuming there is only one matching document, use the first one.
            const barangayStatsDoc = querySnapshot.docs[0];

            // Update the corresponding document in the barangaystats collection
            return barangayStatsDoc.ref.update({
              votercount: voterCount,
              membercount: memberCount,
              membercheckins: memberCheckins,
              activemembers: activeMembers,
            });
          }
        });
      });
    } else {
      return null;
    }
  });
